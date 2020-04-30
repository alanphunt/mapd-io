//
//  ViewController.swift
//  mapd-io
//
//  Created by Josh Tully on 4/2/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UITabBarController, CLLocationManagerDelegate {
    let dm = DistanceManager.dm

    override func viewDidLoad(){

        Thread.sleep(forTimeInterval: 1.0 )
        dm.locationManager = CLLocationManager()
        dm.locationManager?.requestWhenInUseAuthorization()

        if(CLLocationManager.locationServicesEnabled()){
            dm.locationManager?.delegate = self
            dm.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            dm.locationManager?.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            dm.lat1 = location.coordinate.latitude
            dm.lon1 = location.coordinate.longitude
            print(location.coordinate)
        }
    }

}

