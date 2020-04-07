//
//  DesignableButton.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/7.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = (cornerRadius > 0)
        }
    }

}
