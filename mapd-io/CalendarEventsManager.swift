//
//  CalendarEventsManager.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/20/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

class CalendarEventsManager{
    static let cem = CalendarEventsManager()
    
    var events: [Event] = []
    var pastEvents: [Event] = []
    
    func getJson(completion: @escaping (CalendarAPIData) -> ()){
        let url = URL(string: "https://www.googleapis.com/calendar/v3/calendars/mapdio358@gmail.com/events?key=AIzaSyC1s0Z-fmBf2cLX1Ho7_nVs8XHdb4xkA88")!

           URLSession.shared.dataTask(with: url) { (data, res, err) in
                if let data = data{
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
