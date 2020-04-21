//
//  ViewController.swift
//  mapd-io
//
//  Created by Josh Tully on 4/2/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad(){
        CalendarEventsManager.cem.getJson{(json) in
            CalendarEventsManager.cem.events = json.items
        }
        Thread.sleep(forTimeInterval: 0.5 )

    }
    
    

}

