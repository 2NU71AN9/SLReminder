//
//  SecondViewController.swift
//  SLReminder
//
//  Created by RY on 2018/8/9.
//  Copyright © 2018年 SL. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第二页"
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        view.addSubview(label)
        label.center = view.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SLReminder.show("提示内容", duration: 2) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

    let label: UILabel = {
        let label = UILabel()
        label.text = "点击屏幕弹出提示"
        label.sizeToFit()
        return label
    }()
    
    
}
