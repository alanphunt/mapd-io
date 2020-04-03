//
//  MyMapController.swift
//  mapd-io
//
//  Created by Josh Tully on 4/2/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

import GoogleMaps
import CoreLocation

class MyMapController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    var loc: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 40.508681, longitude: -88.991202, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
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
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()

        view.backgroundColor = .gray
                        // The myLocation attribute of the mapView may be null
        if let mylocation = mapView.myLocation {
          print("User's location: \(mylocation)")
        } else {
          print("User's location is unknown")
        }
        
        
    }
    

    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    //do stuff
                }
            }
        }
    }
}
