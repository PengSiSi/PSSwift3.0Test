//
//  TypeViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/5/19.
//  Copyright © 2017年 思 彭. All rights reserved.

// 参考链接: http://www.tuicool.com/articles/I3Yr6f2

import UIKit

class TypeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // open > public > internal (默认) > fileprivate > private
        // 1.open 和 public 都是可以跨 Module 访问的，但 open 修饰的类可以继承，修饰的方法可以 override（此时， open 需同时修饰该方法以及所在类），而 public 不可以。
        // 2.internal 是 Swift 中默认／缺省的访问控制级别。网上对于其他修饰符的解释有很多，而 internal 却很少。 internal 对自身 Module 开放所有源文件，而对外界源代码屏蔽。
        // 3.fileprivate 可在当前文件内所有类访问
        // 4.private 仅可在本类中访问
        
        //Variable used within its own initial value 因为=左右都是相同的变量
        let a = A()
        let str = a.age
        
        
    }
}

// 其他模块可以访问和继承
 class ClassPerson: NSObject {
    
    // 属性
    public var note = "sisi"
    
    // 方法 子类可以访问,不能重写
    public func eat() {
        print("eat")
    }
    
    // 子类可以访问,不能重写
    public final func walk() {
        print("walk")
    }
    
    // 子类可以访问,可以重写
    open func work() {
        print("work")
    }
}

class A: NSObject {
    
    private var name: String? // 只能在本类使用
    fileprivate var age: Int? // 只能在本文件使用
    var height: Int?  
}
