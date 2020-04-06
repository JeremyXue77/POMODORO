//
//  TimerCoordinator.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import Foundation
import UIKit

class TimerCoordinator: Coordinator {
    
    // MARK: Properties
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Methods
    func start() {
        let vc = TimerViewController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(title: "Timer",
                                     image: UIImage(systemName: "alarm"),
                                     tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
}

