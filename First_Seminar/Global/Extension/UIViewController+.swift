//
//  UIViewController+.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/10/14.
//

import Foundation
import UIKit

extension UIViewController{
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = viewControllerToPresent
                UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: nil)
            }
        }
}
