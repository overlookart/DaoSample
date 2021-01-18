//
//  UINavigationController_Extension.swift
//  DaoSample
//
//  Created by xzh on 2021/1/7.
//

import Foundation
import UIKit

extension UINavigationController {
    
    /// 设置NavigationBar分割线颜色
    /// - Parameter color: 颜色
    func setNavigationBar(AppearanceShadowColor color: UIColor) {
        self.navigationBar.shadowImage = UIImage(color: color, size: CGSize(width: 1, height: 1))
    }
}
