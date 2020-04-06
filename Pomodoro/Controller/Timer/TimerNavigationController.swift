//
//  TimerNavigationController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

class TimerNavigationController: UINavigationController {
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Setting methods
    private func setup() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = ThemeColor.darkRed2
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
