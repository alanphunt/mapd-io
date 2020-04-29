//
//  Step2Controller.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/28/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class Step3Controller: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var butt: UIButton!
    let inputValue:String = ""
    
    var asm = AppSettingsManager.asm
    var dm = DistanceManager.dm
    
    override func viewDidAppear(_ animated: Bool) {
   //      _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
//            self.dm.locationManager = CLLocationManager()
//            self.dm.locationManager?.requestWhenInUseAuthorization()
//            if(CLLocationManager.locationServicesEnabled()){
//                self.dm.locationManager?.delegate = self
//                self.dm.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//                self.dm.locationManager?.startUpdatingLocation()
//            }
    //    }
       // print("COORDINATES STEP3CONTROLLER \(self.dm.clLocation?.coordinate)")
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first{
//            self.dm.lat1 = location.coordinate.latitude
//            self.dm.lon1 = location.coordinate.longitude
//            print(location.coordinate)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func buttPressed(_ sender: Any) {
        asm.locationEnabled = true
        let context = asm.context
           let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
           let newEntity = NSManagedObject(entity: entity!, insertInto: context)
           newEntity.setValue(true, forKey: "location")
           do{
               try context.save()
               print("saved location enabled")
           }catch{
               print("failed saving location enabled")
           }
        self.performSegue(withIdentifier: "Step3Segue", sender: self)
    }
}
