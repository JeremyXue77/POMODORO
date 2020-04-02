//
//  HistoryCoordinator.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/2.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import Foundation
import UIKit

class HistoryCoordinator: Coordinator {
    
    // MARK: Properties
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Methods
    func start() {
        let vc = HistoryViewController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .history,
                                     tag: 1)
        navigationController.pushViewController(vc, animated: false)
    }
}
