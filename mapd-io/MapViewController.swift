//
//  MapViewController.swift
//  mapd-io
//
//  Created by Josh Tully on 4/16/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


class MapViewController: UIViewController {

    @IBOutlet weak var viewForGMap: UIView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var etaLabel: UILabel!
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var startTime: UILabel!
    

    @IBOutlet weak var timerLabel: UILabel!
    var lat:Double?
    var lon:Double?


    let camera = GMSCameraPosition.camera(withLatitude: 40.508681, longitude: -88.991202, zoom: 16.0)
    var mapView:GMSMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        let cem = CalendarEventsManager.cem.events


        mapView = GMSMapView.map(withFrame: self.viewForGMap.frame, camera: camera)
        
        let dm = DistanceManager.dm
        let df = DateFormatter()
        df.dateFormat = "MM.dd.yyyy HH:mm"
        self.eventTitle.text = cem[0].summary
        self.location.text = cem[0].location
        self.startTime.text =  df.string(for: cem[0].start.dateTime)
        df.dateFormat = "HH:mm"
        self.startTime.text! += " - \(df.string(for: cem[0].end.dateTime)!)"
        
          
        mapView!.settings.myLocationButton = true
        self.view.addSubview(mapView!)

        mapView!.isMyLocationEnabled = true

        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cem[0].location) {
            placemarks, error in
            let placemark = placemarks?.first
            dm.lat2 = placemark?.location?.coordinate.latitude
            dm.lon2 = placemark?.location?.coordinate.longitude

            let position = CLLocationCoordinate2D(latitude: dm.lat2!, longitude: dm.lon2!) // fix so that when nill it does not terminate the application
            let marker = GMSMarker(position: position)
            marker.title = cem[0].summary
            marker.map = self.mapView!

            dm.getDirectionData(completion: { (json) in
                self.drawMapLine(json)
            })
        }
    }
    
    func drawMapLine(_ data:DirectionData){
        DispatchQueue.main.async {
            let path = GMSMutablePath()
            self.timerLabel.text = "eta. \(data.routes[0].legs[0].duration.text)"
            self.distanceLabel.text = data.routes[0].legs[0].distance.text
            
            let df = DateFormatter()
            df.dateFormat = "HH:mm"
            let d = df.date(from: df.string(from: Date()))
            let date = d?.addingTimeInterval(TimeInterval(data.routes[0].legs[0].duration.value))
            self.etaLabel.text = "Arrival time: \(df.string(from: date!))"
            
            self.timeLogic(data.routes[0].legs[0].duration.value)

            _ = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { _ in
                self.timeLogic(data.routes[0].legs[0].duration.value)
            }
            
            
            for step in data.routes[0].legs[0].steps {
                path.add(CLLocationCoordinate2D(latitude: step.endLocation.lat, longitude: step.endLocation.lng))
            }
            let line = GMSPolyline(path: path)
            line.map = self.mapView!
        }
    }
    
    func timeLogic(_ seconds:Double){
        print("checking eta..")
        let cem2 = CalendarEventsManager.cem.events
        let df = DateFormatter()

        var eventDate = cem2[0].start.dateTime
        var curDate = Date()
        let calendar = Calendar.current
        let etaInMinutes:Double = seconds/60
        let curHour = calendar.component(.hour, from: curDate)
        let curMin = calendar.component(.minute, from: curDate)
        let currentMinuteOfDay = curHour*60 + curMin
        let eventHour = calendar.component(.hour, from: eventDate)
        let eventMin = calendar.component(.minute, from: eventDate)
        let eventMinuteOfDay = eventHour*60 + eventMin

        print(etaInMinutes)
        print(currentMinuteOfDay)
        print(eventMinuteOfDay)
        print(curDate)
        print(eventDate)

        df.dateFormat = "MM.dd.yyyy"
        eventDate = df.date(from: df.string(from: cem2[0].start.dateTime))!
        curDate = df.date(from: df.string(from: Date()))!

        if(curDate == eventDate && currentMinuteOfDay < eventMinuteOfDay){
            if(etaInMinutes + Double(currentMinuteOfDay) >= Double(eventMinuteOfDay)){
                let alert = UIAlertController(title: "You gotta go!", message: "Based on your current location and ETA, you have to leave now!"
                    , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "I'm on my way!", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    func addNavBarImage() {
        
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "Image-1")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }

}
