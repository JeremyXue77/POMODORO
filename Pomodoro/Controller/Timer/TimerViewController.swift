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

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Timer"
        view.backgroundColor = .systemRed
    }
}
