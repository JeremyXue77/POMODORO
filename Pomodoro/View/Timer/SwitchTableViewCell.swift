//
//  SwitchTableViewCell.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/7.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: AnyObject {
    func cellSwitchValueChanged(_ value: Bool)
}

class SwitchTableViewCell: UITableViewCell {
    
    // MARK: Properties
    let cellSwitch: UISwitch = {
        let _switch = UISwitch()
        _switch.frame.size = CGSize(width: 88, height: 44)
        _switch.onTintColor = ThemeColor.semiRed2
        _switch.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        return _switch
    }()
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryView = cellSwitch
        selectionStyle = .none
        backgroundColor = ThemeColor.semiRed
        textLabel?.textColor = ThemeColor.darkRed2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc private func valueChanged(_ sender: UISwitch) {
        delegate?.cellSwitchValueChanged(sender.isOn)
    }
}
