//
//  Event.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/10/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import Foundation

struct Event{
    
    private var location:String
    private var title:String
    private var comments:String
    private var start:Date
    private var end:Date
    private var attendeeEmails:[String]
    private var complete:Bool
    
    
    init?(_ location:String, _ title:String, _ comments:String, _ start:Date, _ end:Date, _ attendeeEmails:[String], _ complete:Bool){
        self.location = location
        self.title = title
        self.comments = comments
        self.start = start
        self.end = end
        self.attendeeEmails = attendeeEmails
        self.complete = complete
    }
    
    public func getLocation() -> String{
        return self.location
    }
    
    mutating public func setLocation(_ location:String){
        self.location = location
    }
    
    public func getTitle() -> String{
        return self.title
    }
    
    mutating public func setTitle(_ title:String){
        self.title = title
    }
    
    public func getComments() -> String{
        return self.comments
    }
    
    mutating public func setComments(_ comments:String){
        self.comments = comments
    }

    public func getStart() -> Date{
        return self.start
    }
    
    mutating public func setStart(_ start:Date){
        self.start = start
    }
    
    public func getEnd() -> Date{
        return self.end
    }
    
    mutating public func setEnd(_ end:Date){
        self.end = end
    }
    
    public func getAttendeeEmails() -> [String]{
        return self.attendeeEmails
    }
    
    mutating public func setAttendeeEmails(_ attendeeEmails:[String]){
        self.attendeeEmails = attendeeEmails
    }

    public func getComplete() -> Bool{
        return self.complete
    }

    mutating public func setComplete(_ complete:Bool){
        self.complete = complete
    }

}
