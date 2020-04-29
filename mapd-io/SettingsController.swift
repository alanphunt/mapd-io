//
//  SettingsController.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/10/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit


class SettingsController: UIViewController{
    
    let asm = AppSettingsManager.asm
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var googleSwitch: UISwitch!
    @IBOutlet weak var locationEnabledSwitch: UISwitch!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    @IBAction func GoogleCalendarSwitch(_ sender: UISwitch!) {
        
    }
    
    @IBAction func PushNotificationsSwitch(_ sender: UISwitch!) {
        
    }
    
    @IBAction func locationSwitch(_ sender: UISwitch) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = asm.gmail
        googleSwitch.setOn(asm.gmail != "", animated: true)
        locationEnabledSwitch.setOn(asm.locationEnabled, animated: true)
        notificationSwitch.setOn(asm.pushEnabled, animated: true)
    }
}
