//
//  PomodoroTimer.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import Foundation

protocol PomodoroTimerDelegate: AnyObject {
    func update(remainingTime: TimeInterval)
    func stateChanged(_ state: PomodoroTimer.State)
    func finish()
}

class PomodoroTimer {
    
    // MARK: Nested types
    enum State {
        case playing, pasue, stop
    }
    
    // MARK: Properties
    weak var delegate: PomodoroTimerDelegate?
    var state: State = .stop {
        didSet {
            delegate?.stateChanged(state)
        }
    }
    var duration: TimeInterval
    var currentTime: TimeInterval = 0
    var remainingTime: TimeInterval {
        duration - currentTime
    }
    
    private var timer: Timer? {
        willSet {
            timer?.invalidate()
        }
    }
    
    // MARK: Initailizers
    init(duration: TimeInterval) {
        self.duration = duration
    }
}

// MARK: - Pomodoro timer methods
extension PomodoroTimer {
    
    func play() {
        state = .playing
        timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                     repeats: true,
                                     block: { [weak self](timer) in
                                        guard let self = self else { return }
                                        self.checkCurrentTime()
                                        self.currentTime += 1
                                        
        })
        timer?.fire()
    }
    
    func pasue() {
        state = .pasue
        timer?.invalidate()
    }
    
    func stop() {
        state = .stop
        currentTime = 0
        timer?.invalidate()
        timer = nil
        delegate?.update(remainingTime: remainingTime)
    }
    
    private func checkCurrentTime() {
        if currentTime > duration {
            delegate?.finish()
            stop()
        } else {
            self.delegate?.update(remainingTime: self.remainingTime)
        }
    }
}
