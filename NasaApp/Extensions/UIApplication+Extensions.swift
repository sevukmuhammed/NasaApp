//
//  UIApplication+Extensions.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

//import UIKit
//
//extension UIApplication {
//    class var topViewController : UIViewController? { return getTopViewController() }
//    private class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//            if let nav = base as? UINavigationController { return getTopViewController(base: nav.visibleViewController) }
//            if let tab = base as? UITabBarController {
//                if let selected = tab.selectedViewController { return getTopViewController(base: selected) }
//            }
//            if let presented = base?.presentedViewController { return getTopViewController(base: presented) }
//            return base
//        }
//}
//
