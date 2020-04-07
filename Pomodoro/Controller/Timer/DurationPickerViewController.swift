//
//  DurationPickerViewController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/7.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

enum DurationType {
    case timer, breakTimer
}

class DurationPickerViewController: UIViewController {
    
    // MARK: Properties
    weak var coordinator: TimerCoordinator?
    private let timerDurations = [25, 30, 35, 40, 45, 50, 55, 60]
    private let breakTimeDurations = [5, 10, 15, 20, 25, 30]

    let durationType: DurationType
    
    // MARK: IBOutlet
    @IBOutlet weak var durationPickerView: UIPickerView! {
        didSet {
            durationPickerView.dataSource = self
            durationPickerView.delegate = self
        }
    }
    
    // MARK: Initailizers
    init(durationType: DurationType) {
        self.durationType = durationType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        switch durationType {
        case .timer:      title = "Timer Duration"
        case .breakTimer: title = "Break Timer Duration"
        }
    }
}

// MARK: - UIPickerViewDataSource
extension DurationPickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch durationType {
        case .timer:      return timerDurations.count
        case .breakTimer: return breakTimeDurations.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = ThemeColor.darkRed2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        switch durationType {
        case .timer:      label.text = "\(timerDurations[row]) min"
        case .breakTimer: label.text = "\(breakTimeDurations[row]) min"
        }
        return label
    }
}

// MARK: - UIPickerViewDelegate {
extension DurationPickerViewController: UIPickerViewDelegate {
    
}
