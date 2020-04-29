//
//  Step1Controller.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/28/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation


class Step1Controller: UIViewController{
        
    @IBOutlet weak var emailInput: UITextField!
    let asm = AppSettingsManager.asm

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Entity")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        do {
//            try asm.context.execute(deleteRequest)
//            print("deleted")
//        } catch let error as NSError {  }
        
        asm.request.returnsObjectsAsFaults = false
              do{
                let results = try asm.context.fetch(asm.request)
                  for data in results as! [NSManagedObject]{
                    if(data.value(forKey: "email") as! String != ""){
                      asm.gmail = data.value(forKey: "email") as! String
                    }

                    }
                if(asm.gmail != ""){
                    callEvents()
                    asm.locationEnabled = true
                    asm.pushEnabled = true
                    self.performSegue(withIdentifier: "SkipIntroSegue", sender: self)
                }
              }catch{
                  print("Failed to retrieve stored email")
              }

    }
    
    
    @IBAction func buttPressed(_ sender: Any) {

        if(emailInput.text != ""){
            asm.gmail = emailInput.text!;
            callEvents()
            let context = asm.context
            let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
            let newEntity = NSManagedObject(entity: entity!, insertInto: context)
            newEntity.setValue(emailInput.text!, forKey: "email")
            do{
                try context.save()
                print("saved")
            }catch{
                print("failed saving")
            }
            self.performSegue(withIdentifier: "Step1Segue", sender: self)
        }else{
            let alert = UIAlertController(title: "Empty input", message: "Whoops! We're going to need your email there, friend."
                , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright, alright", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func callEvents(){
        CalendarEventsManager.cem.getJson{(json) in
            CalendarEventsManager.cem.events = json.items.filter{$0.end.dateTime >= Date()}
            
            if(CalendarEventsManager.cem.events.count == 0){
                CalendarEventsManager.cem.events = [Event(location: "No location", summary: "No event", description: "No event", start: StartTime(dateTime: Date()), end: EndTime(dateTime: Date()), creator: Creator(email: "no email"))]
            }
            CalendarEventsManager.cem.pastEvents = json.items.filter{$0.end.dateTime <= Date()}
        }
    }
    

}
