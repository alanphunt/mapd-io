//
//  Step2Controller.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/28/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit
import CoreData

class Step2Controller: UIViewController{
    
    @IBOutlet weak var butt: UIButton!
    let asm = AppSettingsManager.asm
    
    override func viewDidAppear(_ animated: Bool) {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                
                if error != nil {
                    print("error gaining notification permission")
                }else{
                    let context = self.asm.context
                   let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
                   let newEntity = NSManagedObject(entity: entity!, insertInto: context)
                   newEntity.setValue(true, forKey: "notifications")
                   do{
                       try context.save()
                       print("saved notifications")
                   }catch{
                       print("failed saving notificastions")
                   }
                    AppSettingsManager.asm.pushEnabled = true
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func buttPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "Step2Segue", sender: self)
    }
    
    
}
