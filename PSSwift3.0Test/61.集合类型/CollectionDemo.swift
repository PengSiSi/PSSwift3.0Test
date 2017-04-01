//
//  CollectionDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/4/1.
//  Copyright © 2017年 思 彭. All rights reserved.

// Arrays、Sets和Dictionaries

import UIKit

class CollectionDemo: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个空数组
        var someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        
        // 创建一个带有默认值的数组  threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
       var threeDoubles = [Double](repeating:0.0, count: 3)
       
    }
}
