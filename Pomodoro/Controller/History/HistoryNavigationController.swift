//
//  HistoryNavigationController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/2.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

class HistoryNavigationController: UINavigationController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Setting methods
    private func setup() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = ThemeColor.darkRed2
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
