//
//  EventsViewController.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/10/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit

class EventDetailController: UIViewController{
    
    @IBOutlet weak var summary: UILabel!
    var event:Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summary.text = event?.description
        
    }
    
    
}
