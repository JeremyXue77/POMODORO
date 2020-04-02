//
//  AlarmViewController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/2.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    
    // MARK: Properties
    weak var coordinator: AlarmCoordinator?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alarm"
    }
}
