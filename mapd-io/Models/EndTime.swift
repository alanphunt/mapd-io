//
//  EndTime.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/16/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

struct EndTime{
    var dateTime:Date
}



extension EndTime: Decodable{
    enum CodingKeys: String, CodingKey{
        case dateTime
    }
}
