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
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var startTime: UILabel!
    

    var lat:Double?
    var lon:Double?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cem = CalendarEventsManager.cem.events

        let camera = GMSCameraPosition.camera(withLatitude: 40.508681, longitude: -88.991202, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: self.viewForGMap.frame, camera: camera)
        let dm = DistanceManager.dm
        let df = DateFormatter()
        df.dateFormat = "MM.dd.yyyy"
        self.eventTitle.text = cem[0].summary
        self.location.text = cem[0].location
        self.startTime.text =  df.string(for: cem[0].start.dateTime)

          
        mapView.settings.myLocationButton = true
        self.view.addSubview(mapView)

        mapView.isMyLocationEnabled = true

        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cem[0].location) {
            placemarks, error in
            let placemark = placemarks?.first
            dm.lat2 = placemark?.location?.coordinate.latitude
            dm.lon2 = placemark?.location?.coordinate.longitude

            let position = CLLocationCoordinate2D(latitude: dm.lat2!, longitude: dm.lon2!) // fix so that when nill it does not terminate the application
            let marker = GMSMarker(position: position)
            marker.title = cem[0].summary
            marker.map = mapView


            dm.getDirectionData(completion: { (json) in
             print(json)
            })
        }
    }

}
