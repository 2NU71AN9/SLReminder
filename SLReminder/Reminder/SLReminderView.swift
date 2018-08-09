//
//  SLReminderView.swift
//  SLReminder
//
//  Created by RY on 2018/8/9.
//  Copyright © 2018年 SL. All rights reserved.
//

import UIKit
import Then
import SnapKit

// 电池栏高度 普通20 iPhoneX 40
public let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

class SLReminderView: UIView {

    var text: String? {
        didSet {
            guard let text = text else { return }
            textLabel.text = text
            textLabel.adjustsFontSizeToFitWidth = true
        }
    }
    
    private let imageView = UIImageView().then{
        $0.image = UIImage(named:"tipIcon")
    }

    private let textLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
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
        imageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-5)
            make.size.equalTo(20)
        }
        textLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(imageView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.lessThanOrEqualToSuperview().offset(-5)
            make.height.lessThanOrEqualTo(35)
        }
    }
}
