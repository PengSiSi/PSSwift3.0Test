//
//  ConstructorVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/10.
//  Copyright © 2017年 思 彭. All rights reserved.

// 构造过程是使用类、结构体或枚举类型的实例之前的准备过程。在新实例可用前必须执行这个过程，具体操作包括设置实例中每个存储型属性的初始值和执行其他必须的设置或初始化工作。
// 与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化.

import UIKit

class ConstructorVC: BaseViewController {

    // 指定构造器和便利构造器的语法
    
    /*
 
    init(<#parameters#>) {
        <#statements#>
    }
    
    convenience init(<#parameters#>) {
        <#statements#>
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
        
        let a = Celsius(fromA: 200)
        let b = Celsius(fromB: 300)
        let c = Celsius(10)
        print("a = \(a) b= \(b)")
        
        let cheeseQuestion = surveyQuestion(text: "sisi")
        cheeseQuestion.ask()
        cheeseQuestion.response = "hahahah"
        
        let shop = ShoppingListItem()
        print(shop)
        
        let animal = Animal(special: "Giraffe")
        // 检查构造结果是否成功
        if let giraffe = animal {
            print(animal?.special)
        }
        // 给该可失败构造器传入一个空字符串作为其参数，则会导致构造失败
        let animal1 = Animal(special: "")
        if animal == nil {
            print("error")
        }
        
    }
}

// 定义结构体 构造器
struct Fahrenheit {
 
    // 默认属性值
//    var temperature = 32.0
    
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

// 自定义构造过程
struct Celsius {
    
    var temp: Double
    init(fromA a: Double) {
        temp = (a - 32.0) / 1.8
    }
    init(fromB b: Double) {
        temp = b - 32.0
    }
    
    init(_ celsius: Double) {
        temp = 10
    }
}

// 可选属性类型 可选类型（optional type）。可选类型的属性将自动初始化为nil，表示这个属性是有意在初始化时设置为空的.
class surveyQuestion {
    
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    
    // 构造过程中常量属性的修改
}

// 默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

// 可失败构造器 init? 或者是init!
struct Animal {
    
    let special: String
    init?(special: String) {
        self.special = special
    }
}

// 必要构造器
class someClass {
    
    // 在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加override修饰符：
    
    required init() {
        // 构造器的实现代码
    }
    
    // 析构过程 析构器是在实例释放发生前被自动调用
    deinit {
        
    }
}

