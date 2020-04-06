//
//  PomodoroTests.swift
//  PomodoroTests
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import XCTest
@testable import Pomodoro

class PomodoroTests: XCTestCase {

    func testTimerIntervalConversion() {
        let hours = 12
        let minutes = 23
        let seconds = 34
        let timeInterval = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
        XCTAssertEqual(timeInterval.hours, hours)
        XCTAssertEqual(timeInterval.minutes, minutes)
        XCTAssertEqual(timeInterval.seconds, seconds)
    }
    
    func testTimeString() {
        let hours = 12
        let minutes = 23
        let seconds = 34
        let timeInterval = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
        XCTAssertEqual("12:23:34", TimeStringMaker.make(from: timeInterval))
    }
    
    func testTimeStringWithTimeData() {
        let hours = 12
        let minutes = 23
        let seconds = 34
        let timeInterval = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
        XCTAssertEqual("23:34", TimeStringMaker.make(from: timeInterval, cotains: [.minute, .second]))
    }
    
    func testTimeStringWithSeconsData() {
        let hours = 12
        let minutes = 23
        let seconds = 34
        let timeInterval = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
        XCTAssertEqual("34", TimeStringMaker.make(from: timeInterval, cotains: [.second]))
    }
    
    func testTimeStringEmptyValue() {
        let hours = 0
        let minutes = 0
        let seconds = 0
        let timeInterval = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
        XCTAssertEqual("00:00:00", TimeStringMaker.make(from: timeInterval))
    }
}
