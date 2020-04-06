//
//  TimerView.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

protocol TimerViewDelegate: AnyObject {
    func play()
    func stop()
}

class TimerView: UIView {
    
    // MARK: Properties
    weak var delegate: TimerViewDelegate?

    // MARK: IBOutlet
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: IBAction
    @IBAction func play(_ sender: UIButton) {
        delegate?.play()
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        delegate?.stop()
    }
}

// MARK: - TimerView methods
extension TimerView {
    
    func updateTimeLabel(timeInterval: TimeInterval) {
        let timeString = TimeStringMaker.make(from: timeInterval,
                                              cotains: [.minute, .second])
        timeLabel.text = timeString
    }
    
    func updatePlayButton(isPlaying: Bool) {
        let systemName = !isPlaying ? "play.circle" : "pause.circle"
        playButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}
