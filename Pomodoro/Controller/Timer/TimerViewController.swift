//
//  TimerViewController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    // MARK: Properties
    weak var coordinator: TimerCoordinator?
    private var timerView: TimerView { view as! TimerView }
    private var viewModel: TimerViewModel?

   
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Timer"
        view.backgroundColor = ThemeColor.darkRed
        viewModel = TimerViewModel(timerView: timerView, pomodoroTimer: PomodoroTimer(duration: 60))
    }
    
    // MARK: Actions
    @objc private func showTimerMenu(_ sender: UIBarButtonItem) {
        
    }
}
