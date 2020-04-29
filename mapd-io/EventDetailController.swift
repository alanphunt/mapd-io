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
    
    @IBOutlet weak var eventStart: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var eventTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let df = DateFormatter()
        df.dateFormat = "MM.dd.yyyy hh:mm"
        
        
        summary.text = event?.description
        summary.numberOfLines = 0
        summary.sizeToFit()
        eventLocation.numberOfLines = 0

        eventStart.text = df.string(for: event?.start.dateTime)
        df.dateFormat = "hh:mm"
        eventStart.text! += " - \(df.string(for: event?.end.dateTime) ?? "")"
        eventLocation.text = event?.location
        eventTitle.text = event?.summary
    }
    
    
}
