//
//  FloatViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/10.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class FloatViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 过去 Swift 中的取模运算符（%）对任何数值类型都是有效的，不管是整型还是浮点型（Float、Double、CGFloat）。但到了 Swift3，取余算法是不能作用于浮点型的，否则就会报“‘%’ is unavailable: Use truncatingRemainder instead ”错误
        
        let value1 = 3.5
        let value2 = 3.5
        let result = value1 / value2  // 1.0
        print(result)
        
        /*
        let result2 = value1 % value2
        print(result2)
        */
        
        // 使用 truncatingRemainder 方法进行浮点数取余  注意方法返回值仍然是浮点型
        let result2 = value1.truncatingRemainder(dividingBy: value2)  // 0.0
        print(result2)
    }
}
