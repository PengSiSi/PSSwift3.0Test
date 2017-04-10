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
        // 总结: 
        // 1.两个属性的值都允许为nil,弱引用来解决;
        // 2.一个属性的值允许为nil，而另一个属性的值不允许为nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决.
        // 3.两个属性都必须有值，并且初始化完成后永远不会为nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。
        
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML)
        
        // 总结:
        // 1.在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用。
        // 2.在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用
        // 3.如果被捕获的引用绝对不会变为nil，应该用无主引用，而不是弱引用
        
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
    weak var tenant: Personer?  // 弱引用
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

// 闭包引起的循环强引用
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: (Void) -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
