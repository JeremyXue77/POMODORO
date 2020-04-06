//
//  PomodoroTimerTests.swift
//  PomodoroTests
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import XCTest
@testable import Pomodoro


class PomodoroTimerTests: XCTestCase {
    
    let pomodoroTimer = PomodoroTimer(duration: 5)

    func testTimerPause() {
        pomodoroTimer.start()
        let promise = expectation(description: "Pasue Timer")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.pomodoroTimer.pasue()
            promise.fulfill()
        }
        wait(for: [promise], timeout: 10)
        XCTAssertEqual(pomodoroTimer.state, PomodoroTimer.State.pasue)
        let timeString = TimeStringMaker.make(from: pomodoroTimer.remainingTime, cotains: [.minute, .second])
        XCTAssertEqual(timeString, "00:01")
    }
    
    func testTimerStop() {
        pomodoroTimer.start()
        let promise = expectation(description: "Stop Timer")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.pomodoroTimer.stop()
            promise.fulfill()
        }
        wait(for: [promise], timeout: 10)
        XCTAssertEqual(pomodoroTimer.state, PomodoroTimer.State.stop)
    }
    
    func testTimerAutomaicStop() {
        pomodoroTimer.start()
        let promise = expectation(description: "Stop Timer")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            promise.fulfill()
        }
        wait(for: [promise], timeout: 10)
        XCTAssertEqual(pomodoroTimer.state, PomodoroTimer.State.stop)
        let timeString = TimeStringMaker.make(from: pomodoroTimer.remainingTime, cotains: [.minute, .second])
        XCTAssertEqual(timeString, "00:05")
    }

}
