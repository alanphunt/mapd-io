//
//  Attendee.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/16/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

struct Attendee{
    var email:String
}



extension Attendee: Decodable{
    enum CodingKeys: String, CodingKey{
        case email
    }
}
