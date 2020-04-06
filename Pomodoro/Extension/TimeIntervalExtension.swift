//
//  TimeIntervalExtension.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    var seconds: Int {
        Int(self) % 60
    }

    var minutes: Int {
        (Int(self) / 60 ) % 60
    }

    var hours: Int {
        Int(self) / 3600
    }
}
