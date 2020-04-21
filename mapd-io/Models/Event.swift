//
//  Event.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/10/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

struct Event{
    
    var location:String
    var summary:String
    var description:String
    var start:StartTime
    var end:EndTime
    var creator:Creator

}

extension Event: Decodable{
    enum CodingKeys: String, CodingKey{
        case summary
        case description
        case location
        case creator
        case start
        case end
    }
}
