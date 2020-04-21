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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return CalendarEventsManager.cem.events.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tv.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.label.text = CalendarEventsManager.cem.events[indexPath.row].summary
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EventDetailController") as? EventDetailController
        vc?.event = CalendarEventsManager.cem.events[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    
}

