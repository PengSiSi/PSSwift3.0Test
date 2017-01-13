//
//  CounterLabelViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/13.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class CounterLabelViewController: BaseViewController {

    var counterLabel: CounterLabel!
    var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化
        counterLabel = CounterLabel(frame: CGRect(x: 50, y: 70, width: 20, height: 20))
        counterLabel.num = 5
        self.view.addSubview(counterLabel)
        
        // 步进器初始化
        stepper = UIStepper()
        stepper.center = CGPoint(x: 60, y: 120)
        stepper.value = Double(counterLabel.num)
        stepper.stepValue = 1;
        stepper.isContinuous = true
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        self.view.addSubview(stepper)
    }
    
    func stepperValueChanged() {
        
        counterLabel.num = Int(stepper.value)
    }
}
