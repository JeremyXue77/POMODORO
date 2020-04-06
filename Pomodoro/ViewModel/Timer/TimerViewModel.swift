//
//  TimerViewModel.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import Foundation
import UIKit

class TimerViewModel {
    
    // MARK: Properties
    private let timerView: TimerView
    private var pomodoroTimer: PomodoroTimer
    
    // MARK: Initializers
    init(timerView: TimerView, pomodoroTimer: PomodoroTimer) {
        self.timerView = timerView
        self.pomodoroTimer = pomodoroTimer
        self.pomodoroTimer.delegate = self
        self.timerView.delegate = self
        self.timerView.updateTimeLabel(timeInterval: pomodoroTimer.duration)
    }
}

// MARK: - TimerViewDelegate
extension TimerViewModel: TimerViewDelegate {
    
    func createTimer(_ pomodoroTimer: PomodoroTimer) {
        self.pomodoroTimer = pomodoroTimer
        self.pomodoroTimer.delegate = self
        timerView.updateTimeLabel(timeInterval: pomodoroTimer.duration)
    }
    
    func play() {
        switch pomodoroTimer.state {
        case .playing: pomodoroTimer.pasue()
        default:       pomodoroTimer.play()
        }
    }
    
    func stop() {
        pomodoroTimer.stop()
    }
}

// MARK: - PomodoroTimerDelegate
extension TimerViewModel: PomodoroTimerDelegate {
    
    func update(remainingTime: TimeInterval) {
        timerView.updateTimeLabel(timeInterval: remainingTime)
    }
    
    func stateChanged(_ state: PomodoroTimer.State) {
        timerView.updatePlayButton(isPlaying: pomodoroTimer.state == .playing)
    }
    
    func finish() {
        print("Finish")
    }
}
