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
    private let pomodoroTimer: PomodoroTimer
    
    // MARK: Initializers
    init(timerView: TimerView, pomodoroTimer: PomodoroTimer) {
        self.timerView = timerView
        self.pomodoroTimer = pomodoroTimer
        self.timerView.updateTimeLabel(timeInterval: pomodoroTimer.duration)
        self.pomodoroTimer.delegate = self
        self.timerView.delegate = self
    }
}

// MARK: - TimerViewDelegate
extension TimerViewModel: TimerViewDelegate {
    
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
