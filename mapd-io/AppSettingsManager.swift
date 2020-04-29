//
//  AppSettingsManager.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/28/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class AppSettingsManager{
    static var asm = AppSettingsManager()

    var gmail = ""
    var pushEnabled = false
    var locationEnabled = false
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")

    

}
