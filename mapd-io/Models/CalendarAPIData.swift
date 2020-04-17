//
//  CalendarAPIData.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/16/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

struct CalendarAPIData{
    let items:[Event]
}


extension CalendarAPIData: Decodable{
    enum CodingKeys: String, CodingKey{
        case items
    }
}
