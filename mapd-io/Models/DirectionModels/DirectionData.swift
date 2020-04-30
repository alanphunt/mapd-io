//
//  DirectionData.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/29/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

struct DirectionData{
    let routes:[Route]
}


extension DirectionData: Decodable{
    enum CodingKeys: String, CodingKey{
        case routes
    }
}


struct Route{
    var overviewPolylines:Overview_Polyline
    var legs:[Leg]
}


extension Route: Decodable{
    enum CodingKeys: String, CodingKey{
        case overviewPolylines = "overview_polyline"
        case legs
    }
}

struct Leg{
    var distance:Distance
    var duration:Duration
    var endAddress:String
    var startAddress:String
    var steps:[Step]
}


extension Leg: Decodable{
    enum CodingKeys: String, CodingKey{
        case distance, duration
        case endAddress = "end_address"
        case startAddress = "start_address"
        case steps
    }
}

struct Step{
    var distance:Distance
    var duration:Duration
    var polyline:Polyline
    var endLocation:End_Location
}

extension Step: Decodable{
    enum CodingKeys: String, CodingKey{
        case distance, duration, polyline
        case endLocation = "end_location"
    }
}

struct End_Location{
    var lat:Double
    var lng:Double

}

extension End_Location: Decodable{
    enum CodingKeys: String, CodingKey{
        case lat, lng
    }
}

struct Polyline{
    var points:String
}


extension Polyline: Decodable{
    enum CodingKeys: String, CodingKey{
        case points
    }
}

struct Distance{
    var text:String
    var value:Double
}


extension Distance: Decodable{
    enum CodingKeys: String, CodingKey{
        case text, value
    }
}

struct Duration{
    var text:String
    var value:Double
}

extension Duration: Decodable{
    enum CodingKeys: String, CodingKey{
        case text, value
    }
}

struct Overview_Polyline{
    var points:String
}

extension Overview_Polyline: Decodable{
    enum CodingKeys: String, CodingKey{
        case points
    }
}
