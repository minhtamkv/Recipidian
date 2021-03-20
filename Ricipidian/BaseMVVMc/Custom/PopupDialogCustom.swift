//
//  PopupDialogCustom.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

class PopupDialogCustom: UIAlertController {
    static func initWithPopupView(popupDialogView: IPopupDialogView,
                                  style: UIAlertController.Style = .actionSheet,
                                  source: UIView? = nil,
                                  title: String? = nil,
                                  message: String? = nil) -> PopupDialogCustom
    {
        let popupDialog = PopupDialogCustom(style: style, source: source, title: title, message: message)
        popupDialog.view.frame = CGRect(x: popupDialog.view.frame.origin.x, y: popupDialog.view.frame.origin.y, width: 400, height: popupDialog.view.frame.height)

        let customView = popupDialogView as! UIView
        popupDialog.view.addSubview(customView)
        let heightCustomView = customView.bounds.size.height

        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: popupDialog.view.leadingAnchor, constant: 0),
            customView.trailingAnchor.constraint(equalTo: popupDialog.view.trailingAnchor, constant: 0),
            customView.heightAnchor.constraint(equalToConstant: heightCustomView),
            customView.topAnchor.constraint(equalTo: popupDialog.view.topAnchor, constant: 60),
            popupDialog.view.heightAnchor.constraint(equalToConstant: heightCustomView + 105),
        ])

        //  Để tránh bàn phím đẩy popup lên khi show
        popupDialog.addTextField(configurationHandler: nil)
        // popupDialog.view.layoutIfNeeded()
        return popupDialog
    }

    func addGesture(_ tapGestureRecognizer: UITapGestureRecognizer) {
        view.superview?.addGestureRecognizer(tapGestureRecognizer)
        view.superview?.isUserInteractionEnabled = true
    }

    static func initWithCommon(style: UIAlertController.Style = .alert,
                               source: UIView? = nil,
                               title: String?,
                               message: String?) -> PopupDialogCustom {
        let popupDialog = PopupDialogCustom(style: style, source: source, title: title, message: message)
        return popupDialog
    }

    func addActionPopup(title: String, style: UIAlertAction.Style = .default, actionClosure: NoParamClosure?) {
        _ = addActionPopupReturn(title: title, style: style, actionClosure: actionClosure)
    }

    func addActionPopupReturn(title: String, style: UIAlertAction.Style = .default, actionClosure: NoParamClosure?) -> UIAlertAction {
        let alertAction = UIAlertAction(title: title, style: style, handler: { (_: UIAlertAction) -> Void in
            actionClosure?()
        })
        addAction(alertAction)
        return alertAction
    }

    func addActionCancel(title: String, actionClosure: NoParamClosure? = nil) {
        addActionPopup(title: title, style: .cancel, actionClosure: actionClosure)
    }
}
