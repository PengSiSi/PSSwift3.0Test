//
//  ModifierViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/8.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ModifierViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Swift修饰符的使用"
        // 1.private访问级别所修饰的属性或者方法只能在当前类里访问。extension定义的方法也不能访问
        test()
        //test1()
        
        // 2.fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问。
        test2()
        
        //3.internal（默认访问级别，internal修饰符可写可不写）internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
        test3()
        
        // 4.public可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。
        test4()
        
        // 5.open可以被任何人使用，包括override和继承。
        test5()
    }
    
    private func test() {
        
        print("test")
    }
}

extension ModifierViewController {
    
    private func test1() {
        
        print("test1")
    }
    
    fileprivate func test2() {
        
        print("test2")
    }
    
    internal func test3() {
        
        print("test3")
    }
    
    public func test4() {
        
        print("test4")
    }
    
    open func test5() {
        
        print("test5")
    }
}

