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

    let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    @IBOutlet weak var viewForGMap: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 40.508681, longitude: -88.991202, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: self.viewForGMap.frame, camera: camera)
        mapView.settings.myLocationButton = true
        self.view.addSubview(mapView)

        mapView.isMyLocationEnabled = true

        // Creates a marker in the center of the map. ** will possibly be used **
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView

        //location services
        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
    }

}

extension MapViewController: CLLocationManagerDelegate {
    // called when the authorization status is changed for the core location permission
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("location manager authorization status changed")
        
        switch status {
        case .authorizedAlways:
            print("user allow app to get location data when app is active or in background")
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                }
            }
        case .authorizedWhenInUse:
            return
        case .denied:
            // show alert that location is needed?
            return
        case .restricted:
            return
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            return
        default:
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       if let location = locations.last {
           print(location.coordinate, "Coordinate")
           print(location.horizontalAccuracy, "Coordinate Accuracy")
           print(location.course, "Course")
           print(location.speed, "Speed")
           print(location.timestamp, "Timestamp")
           
           self.location = location
       }
   }
}
