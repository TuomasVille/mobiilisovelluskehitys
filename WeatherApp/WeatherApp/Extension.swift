//
//  Extension.swift
//  WeatherApp
//
//  Created by Tuomas Käyhty on 31/01/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import SwiftUI

extension Int {
    var timestamp: TimeInterval {
        return TimeInterval(self)
    }
    
    var toString: String {
        return String(self)
    }
}

