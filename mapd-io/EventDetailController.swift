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
        addNavBarImage()
        
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
    func addNavBarImage() {
        
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "LogoImage")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    
}
