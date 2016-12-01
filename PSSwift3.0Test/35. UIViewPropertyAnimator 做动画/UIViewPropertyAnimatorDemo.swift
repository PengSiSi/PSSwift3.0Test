//
//  UIViewPropertyAnimatorDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/30.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class UIViewPropertyAnimatorDemo: BaseViewController {

    let animationView: UIView = UIView(frame: CGRect(x: 10, y: 200, width: 50, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "UIViewPropertyAnimator 做动画";
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 50, height: 30)
        btn.backgroundColor = UIColor.red
        btn.setTitle("点击", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(btnDidClick), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    func btnDidClick() {
        
        demo1()
    }
}

extension UIViewPropertyAnimatorDemo {
    
    /* 简单动画
    1) 这个动画是通过闭包来定义的，与UIView 动画类的“UIView.animation(duration:…)”很相似。
    2) 返回一个对象，即动画创建者。
    3）这个动画不是立刻开始的，而是通过 `startAnimation()`方法触发的。
    */
    func demo1() {
        
        self.view.addSubview(animationView)
        animationView.backgroundColor = UIColor.red;
        let finalPoint = CGPoint(x: k_ScreenWidth - 20, y: 10)
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
            self.animationView.center = finalPoint
        }
        animator.startAnimation()
    }
    
    func demo2() {
        
        self.view.addSubview(animationView)
        animationView.backgroundColor = UIColor.red;
//        let finalPoint = CGPoint(x: k_ScreenWidth - 20, y: 10)
        let animator = UIViewPropertyAnimator(duration: 0.3, controlPoint1: CGPoint(x: 0.1, y: 0.5), controlPoint2: CGPoint(x: 0.5, y: 0.2)) {
            
            self.animationView.alpha = 0.0
        }
        animator.startAnimation()
    }

}
