//
//  TableViewController.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/10/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
            

    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        if(section == 0){
            label.text = "Current Events"
        }else{
            label.text = "Past Events"
        }
        return label
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(section == 0){
            return CalendarEventsManager.cem.events.count
        }else{
            return CalendarEventsManager.cem.pastEvents.count
        }
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tv.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let df = DateFormatter()
        df.dateFormat = "hh:MM"
        
        if(indexPath.section == 0){
            cell.label.text = CalendarEventsManager.cem.events[indexPath.row].summary
            cell.location.text = CalendarEventsManager.cem.events[indexPath.row].location
            
            cell.startTime.text = df.string(for: CalendarEventsManager.cem.events[indexPath.row].start.dateTime)
        }else{
            cell.label.text = CalendarEventsManager.cem.pastEvents[indexPath.row].summary
            
            cell.location.text = CalendarEventsManager.cem.pastEvents[indexPath.row].location
            
            cell.startTime.text = df.string(for: CalendarEventsManager.cem.pastEvents[indexPath.row].start.dateTime)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EventDetailController") as? EventDetailController
        if(indexPath.section == 0){
            vc?.event = CalendarEventsManager.cem.events[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }else{
            vc?.event = CalendarEventsManager.cem.pastEvents[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    
    }
    
}

