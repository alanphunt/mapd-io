//
//  DistanceManager.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/29/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation
import CoreLocation

class DistanceManager{
    static let dm = DistanceManager()
    
    var locationManager:CLLocationManager?
    var clLocation: CLLocation?
    var lat1:Double?
    var lat2:Double?
    var lon1:Double?
    var lon2:Double?
    
    
    func getDirectionData(completion: @escaping (DirectionData) -> ()){
        let url = URL(string:"https://maps.googleapis.com/maps/api/directions/json?origin=\(lat1!)%2C\(lon1!)&destination=\(lat2!)%2C\(lon2!)&mode=walking&key=AIzaSyC1s0Z-fmBf2cLX1Ho7_nVs8XHdb4xkA88")!
            print(url)

            URLSession.shared.dataTask(with: url) { (data, res, err) in
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        do{
                            let json = try decoder.decode(DirectionData.self, from: data)
                            completion(json)
                        }catch{
                            print(error)
                        }
                    }
            }.resume()
    }
    
}
