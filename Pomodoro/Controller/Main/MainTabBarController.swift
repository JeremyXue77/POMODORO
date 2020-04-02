//
//  MainTabBarController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/2.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: Properties
    private let mainCoordinator = AlarmCoordinator(navigationController: UINavigationController())
    private let historyCoordinator = HistoryCoordinator(navigationController: UINavigationController())
    
    private var coordinators: [Coordinator] {
        [
            mainCoordinator,
            historyCoordinator
        ]
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinators.forEach({$0.start()})
        viewControllers = coordinators.map({$0.navigationController})
    }
}
