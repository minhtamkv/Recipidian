//
//  UIViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }

    class var className: String {
        return NSStringFromClass(self)
    }

    func setClassOwnerNewReturn(classNew: AnyClass) -> Self {
        object_setClass(self, classNew)
        return self
    }

    func setClassOwnerNew(classNew: AnyClass) {
        object_setClass(self, classNew)
    }

    var topbarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) + (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
                (navigationController?.navigationBar.frame.height ?? 0.0)
            return topBarHeight
        }
    }
}
