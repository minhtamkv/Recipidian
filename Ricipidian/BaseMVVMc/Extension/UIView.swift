//
//  UIView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

extension UIView {
    class var identifier: String {
        return String(describing: self)
    }

    class var nibName: String {
        return String(describing: self)
    }

    func setClassOwnerNewReturn(classNew: AnyClass) -> Self {
        object_setClass(self, classNew)
        return self
    }

    func setClassOwnerNew(classNew: AnyClass) {
        object_setClass(self, classNew)
    }

    var safeAreaBottom: CGFloat {
        if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindow {
                return window.safeAreaInsets.bottom
            }
        }
        return 0
    }

    var safeAreaTop: CGFloat {
        if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindow {
                return window.safeAreaInsets.top
            }
        }
        return 0
    }

    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard
            let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        else { fatalError("missing expected nib named: \(name)") }
        guard
            /// we're using `first` here because compact map chokes compiler on
            /// optimized release, so you can't use two views in one nib if you wanted to
            /// and are now looking at this
            let view = nib.first as? Self
        else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
}
