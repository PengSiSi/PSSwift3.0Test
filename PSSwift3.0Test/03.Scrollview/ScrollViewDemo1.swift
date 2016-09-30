//
//  ScrollViewDemo1.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ScrollViewDemo1: UIView {

    // 创建label
    var label = UILabel()
    
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
        label.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        label.text = text
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    // 必须写
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.center = self.center
    }
}
