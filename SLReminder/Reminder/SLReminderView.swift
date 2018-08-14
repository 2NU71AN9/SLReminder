//
//  SLReminderView.swift
//  SLReminder
//
//  Created by RY on 2018/8/9.
//  Copyright © 2018年 SL. All rights reserved.
//

import UIKit

// 电池栏高度 普通20 iPhoneX 40
public let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

class SLReminderView: UIView {

    var text: String? {
        didSet {
            guard let text = text else { return }
            textLabel.text = text
        }
    }
    
    private lazy var imageView: UIImageView  = {
        let imageView = UIImageView()
        let path = Bundle(for: SLReminder.self).resourcePath! + "/Reminder.bundle"
        let CABundle = Bundle(path: path)!
        let image = UIImage(named: "tipIcon", in:  CABundle, compatibleWith: nil)
        imageView.image = image
        return imageView
    }()
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    init() {
        super.init(frame: CGRect(x: 0,
                                 y: -(statusBarHeight + 44),
                                 width: UIScreen.main.bounds.width,
                                 height: (statusBarHeight + 44) * 2))
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.2
        
        addSubview(imageView)
        addSubview(textLabel)
        
        layoutConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutConstraint() {
        imageView.frame = CGRect(x: 15, y: self.bounds.height - 28, width: 20, height: 20)
        textLabel.frame = CGRect(x: imageView.frame.maxX + 15,
                                 y: imageView.frame.minY,
                                 width: bounds.width - 15 - imageView.frame.maxX - 15,
                                 height: imageView.bounds.height)
    }
}
