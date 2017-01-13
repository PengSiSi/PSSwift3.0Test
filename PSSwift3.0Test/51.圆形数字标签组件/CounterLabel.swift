//
//  CounterLabel.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/13.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class CounterLabel: UILabel {

    // 设置数值
    var num: Int = 0 {
        didSet {
            // <0则不显示
            if num < 0 {
                self.isHidden = true
            } else {
                self.isHidden = false
                self.text = "\(num)"
                playAnimation()
            }
        }
    }
    
    // init方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    // init方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 页面初始化设置
    func initialSetup() {
        
        self.layer.masksToBounds = true
        self.textAlignment = .center
        // 默认字体
        self.font = UIFont.systemFont(ofSize: 14)
        // 背景颜色
        self.backgroundColor = UIColor(red: 0x09/255, green: 0xbb/255, blue: 0x07/255, alpha: 1)
        //文字默认为白色
        self.textColor = .white
        //文字大小自适应标签宽度
        self.adjustsFontSizeToFitWidth = true
        //文本中线于label中线对齐
        self.baselineAdjustment = UIBaselineAdjustment.alignCenters
        //默认不显示，当设置了num且大于0才显示
        self.isHidden = true
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        // 圆角半径
        self.layer.cornerRadius = self.bounds.width / 2
    }
    // 数字改变播放动画
    func playAnimation(){
        
        // 从小到大.有弹性的效果
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5, options: UIViewAnimationOptions(),
                       animations: {
                        self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

