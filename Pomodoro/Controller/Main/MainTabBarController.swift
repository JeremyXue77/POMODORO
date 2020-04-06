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
    private let mainCoordinator = TimerCoordinator(navigationController: TimerNavigationController())
    private let historyCoordinator = HistoryCoordinator(navigationController: HistoryNavigationController())
    
    private var coordinators: [Coordinator] {
        [
            mainCoordinator,
            historyCoordinator
        ]
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Setting methods
    private func setup() {
        coordinators.forEach({$0.start()})
        viewControllers = coordinators.map({$0.navigationController})
        tabBar.barStyle = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .systemGray2
        tabBar.isTranslucent = false
    }
}
