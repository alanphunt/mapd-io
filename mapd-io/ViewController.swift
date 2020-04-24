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
            CalendarEventsManager.cem.events = json.items.filter{$0.end.dateTime >= Date()}
            
            if(CalendarEventsManager.cem.events.count == 0){
                CalendarEventsManager.cem.events = [Event(location: "No location", summary: "No event", description: "No event", start: StartTime(dateTime: Date()), end: EndTime(dateTime: Date()), creator: Creator(email: "no email"))]
                
            }
            CalendarEventsManager.cem.pastEvents = json.items.filter{$0.end.dateTime <= Date()}
            print("past: ")
                print(CalendarEventsManager.cem.pastEvents)
            print("current: ")
                print(CalendarEventsManager.cem.events)
        }
        Thread.sleep(forTimeInterval: 0.5 )

    }
    
    

}

