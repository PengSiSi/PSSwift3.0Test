
//
//  TestViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1：对一个Int类型数组的元素进行2倍放大
        let arr = [0, 1, 2, 3, 4, 50, 70]
        let resultArray = arr.map {
            $0 * 2
        }
        print(resultArray)  // [0, 2, 4, 6, 8]
        
        // 2.filter 数组中大于30的数据 用于选择数组元素中满足某种条件的元素
        let arr1 = arr.filter {
            $0 > 30
        }
        print(arr1)
        
        // 3.reduce方法把数组元素组合计算为一个值。
        let sum = arr.reduce(0, {
            $0 + $1
        })
        print("sum = \(sum)")
    }
}
