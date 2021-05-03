//
//  AlertMessage.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import UIKit
import NotificationBannerSwift

final class AlertMessage {
    static var banner: GrowingNotificationBanner?

    static func showMessage(title: String = "CommonError".localized, subtitle: String? = "", bannerStyle: BannerStyleMessage = .danger) {
        if let bannerCurrent = self.banner {
            if !bannerCurrent.isDisplaying {
                banner = GrowingNotificationBanner(title: title, subtitle: subtitle, style: BannerStyle(rawValue: bannerStyle.rawValue) ?? BannerStyle.info)
            } else {
                //bannerCurrent.dismiss()
            }
        } else {
            banner = GrowingNotificationBanner(title: title, subtitle: subtitle, style: BannerStyle(rawValue: bannerStyle.rawValue) ?? BannerStyle.info)
        }

        banner?.show()
    }
}
