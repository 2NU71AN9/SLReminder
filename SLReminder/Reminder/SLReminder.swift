//
//  SLReminder.swift
//  SLReminder
//
//  Created by RY on 2018/8/9.
//  Copyright © 2018年 SL. All rights reserved.
//

import UIKit
import pop

public class SLReminder: NSObject {
    
    /// 从屏幕上方弹出提示
    ///
    /// - Parameters:
    ///   - text: 提示内容
    ///   - duration: 持续时间,默认2秒
    ///   - completion: 完成后下一步的操作
    public static func show(_ text: String?, duration: Double = 2, completion: (() -> Void)? = nil) {
        guard let text = text,
            (text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString).length > 0,
            let cur_vc = cur_visible_vc
        else { return }
        
        _ = cacheArray.compactMap { $0 != cacheArray.last ? $0?.removeFromSuperview() : () }
        cacheArray = [cacheArray.last] as! [SLReminderView?]
        
        let reminderView = SLReminderView()
        cacheArray.append(reminderView)
        cur_vc.navigationController != nil
            ? cur_vc.navigationController?.view.addSubview(reminderView)
            : cur_vc.view.addSubview(reminderView)
        reminderView.text = text
        
        let showAnim: POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleY)
        showAnim.fromValue = 0
        showAnim.toValue = 1
        showAnim.springBounciness = 13
        showAnim.springSpeed = 20
        reminderView.layer.pop_add(showAnim, forKey: "show")
        
        let hideAnim: POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleY)
        hideAnim.toValue = 0
        hideAnim.springBounciness = 0
        /// 弹回动画
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            reminderView.layer.pop_add(hideAnim, forKey: "hide")
            completion?()
            hideAnim.completionBlock = {_,_ in
                reminderView.removeFromSuperview()
            }
        }
    }
    
    private static var cacheArray: [SLReminderView?] = []
}

var cur_visible_vc: UIViewController? {
    weak var vc = UIApplication.shared.keyWindow?.rootViewController
    while true {
        if vc?.isKind(of: UITabBarController.self) ?? false {
            vc = (vc as? UITabBarController)?.selectedViewController
        } else if vc?.isKind(of: UINavigationController.self) ?? false {
            vc = (vc as? UINavigationController)?.visibleViewController
        } else if vc?.presentedViewController != nil {
            vc = vc?.presentedViewController
        }else{
            break
        }
    }
    return vc
}
