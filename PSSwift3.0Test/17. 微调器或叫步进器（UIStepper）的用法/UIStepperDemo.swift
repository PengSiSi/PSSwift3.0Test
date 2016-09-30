//
//  UIStepperDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/28.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class UIStepperDemo: BaseViewController {

    var stepper: UIStepper!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // label
        label = UILabel(frame: CGRect(x: 100, y: 120, width: 100, height: 30))
        label.backgroundColor = UIColor.green
        label.textAlignment = .center
        view.addSubview(label)
        
        // stepper
        stepper = UIStepper()
        view.addSubview(stepper)
//        stepper.center = self.view.center
        stepper.frame = CGRect(x: 100, y: 70, width: 100, height: 50)
//        stepper.backgroundColor = UIColor.red
        //设置stepper的范围与初始值
        stepper.maximumValue = 20
        stepper.minimumValue = 1
        stepper.value = 5
        // 每次增减的值
        stepper.stepValue = 0.5
        //设置stepper可以按住不放来连续更改值
        stepper.isContinuous = true
        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
        stepper.wraps = true
        stepper.addTarget(self, action: #selector(stepValueChanged), for: .valueChanged)
        
        // 设置貌似没效果
//        stepper.setDividerImage(UIImage(named: "forward"), forLeftSegmentState: .normal, rightSegmentState: .selected)
//        label = nil
    }

    func stepValueChanged() {
        
        label.text = String(stepper.value)
    }
}
