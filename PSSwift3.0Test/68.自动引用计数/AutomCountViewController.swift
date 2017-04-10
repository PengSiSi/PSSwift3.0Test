//
//  AutomCountViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/10.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class AutomCountViewController: BaseViewController {

    var refrence1: Personer?
    var refrence2: Personer?
    var refrence3: Personer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refrence1 = Personer(name: "aaa")
        refrence2 = refrence1
        refrence3 = refrence1
        
        refrence1 = nil
        refrence2 = nil
        refrence3 = nil  // 当都置为nil之后才会调用打印 aaa is being deinitialized
        
        var join: Personer?
        var unit4A: Apartment?
        join = Personer(name: "siis")
        unit4A = Apartment(unit: "4A")
        join?.apartment = unit4A
        unit4A?.tenant = join
        
        // 两个实例关联后会产生一个循环强引用,不会被 ARC 销毁
        join = nil
        unit4A = nil
        
        // 解决实例之间的循环强引用 
        /*Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用（weak reference）和无主引用（unowned reference）。
          对于生命周期中会变为nil的实例使用弱引用。相反地，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。*/
    }
}

class Personer {
    
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

// 类实例之间的循环强引用
class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Personer?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
