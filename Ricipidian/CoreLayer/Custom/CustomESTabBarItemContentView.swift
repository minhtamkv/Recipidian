//
//  CustomESTabBarItemContentView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import ESTabBarController_swift
import UIKit

class CustomESTabBarItemContentView: ESTabBarItemContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor(red: 254 / 255.0, green: 73 / 255.0, blue: 42 / 255.0, alpha: 1.0)
        iconColor = UIColor(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor(red: 254 / 255.0, green: 73 / 255.0, blue: 42 / 255.0, alpha: 1.0)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
