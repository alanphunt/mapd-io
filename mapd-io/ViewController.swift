//
//  ViewController.swift
//  mapd-io
//
//  Created by Josh Tully on 4/2/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit

//hello

class ViewController: UITabBarController {

    override func viewDidLoad(){
        super.viewDidLoad()
            getJson{(json) in
                print(json)
            }

        
    }
    
    func getJson(completion: @escaping (CalendarAPIData) -> ()){
        let url = URL(string: "https://www.googleapis.com/calendar/v3/calendars/mapdio358@gmail.com/events?key=AIzaSyC1s0Z-fmBf2cLX1Ho7_nVs8XHdb4xkA88")!

           URLSession.shared.dataTask(with: url) { (data, res, err) in
                if let data = data{
                    let df = DateFormatter()
                    df.timeStyle = .medium
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    do{
                        let json = try decoder.decode(CalendarAPIData.self, from: data)
                        completion(json)
                    }catch{
                        print(error)
                    }
                }
        }.resume()
    }

}

