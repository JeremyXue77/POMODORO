//
//  HistoryViewController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/2.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    weak var coordinator: HistoryCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
    }
}
