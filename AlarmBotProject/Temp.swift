//
//  Temp.swift
//  Chip- Hotel Booking Chatbot
//
//  Created by Ashna Chandra on 4/7/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation

class Temp {
    
    static var shared = Temp()
    private init() {}
    
    var tempDate: Date?
    
    var tempArray = [Date]()
    
}
