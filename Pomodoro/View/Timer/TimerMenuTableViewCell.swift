//
//  TimerMenuTableViewCell.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/7.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

class TimerMenuTableViewCell: UITableViewCell {

    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = ThemeColor.semiRed
        textLabel?.textColor = ThemeColor.darkRed2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
