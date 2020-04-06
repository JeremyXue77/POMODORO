//
//  TimeStringMaker.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import Foundation

class TimeStringMaker {
    
    enum TimeData: CaseIterable {
        case hour, minute, second
    }
    
    static func make(from timeInterval: TimeInterval, cotains timeDatas: [TimeData] = TimeData.allCases) -> String {
        var strings: [String] = []
        if timeDatas.contains(.hour) {
            let hours = checkTensDigit(value: timeInterval.hours)
            strings.append(hours)
        }
        if timeDatas.contains(.minute) {
            let minutes = checkTensDigit(value: timeInterval.minutes)
            strings.append(minutes)
        }
        if timeDatas.contains(.second) {
            let seconds = checkTensDigit(value: timeInterval.seconds)
            strings.append(seconds)
        }
        return strings.joined(separator: ":")
    }
    
    static private func checkTensDigit(value: Int) -> String {
        (value >= 10) ? "\(value)" : "0\(value)"
    }
}
