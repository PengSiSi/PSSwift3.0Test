//
//  NewPointViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/8.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class NewPointViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Swift3新特性汇总"
        
        // 1.弃用 ++ 与 -- 操作符,使用复合加法运算（+=）与减法运算（-=），或者使用普通的加法运算（+）与减法运算（-）实现同样的功能.
        var i = 2
        i += 2   //i = i + 2
        i -= 2   //i = i - 2
        print("i = \(i)")
        
        // 2.废除C语言风格的for循环
        for i in 1...10 {
            print(i)
        }
        
        (1...10).forEach { (j) in
            
            print("j = \(j)")
        }
        
        // 3.移除函数参数的 var 标记
        /*
         苹果又给出了一种不用给第一个参数带标签的解决方案。即在第一个参数前面加上一个下划线。
         （不过这个只是方便我们代码从 Swift2 迁移到 Swift3 的一个折中方案，可以的话还是建议将所有的参数都带上标签。）
         */
        add(a: "思思")
        
        // 4.Selector 不再允许使用 String
        // 5.key-path不再只能使用String
        let user = User()
        user.name = "sisi"
        user.age = 20
        // 使用KVC取值,注意#keyPath里是  类名.属性
        let name = user.value(forKeyPath: #keyPath(User.name))
        print("name = \(name)")
        // 使用KVC赋值
        user.setValue("xixixi", forKeyPath: #keyPath(User.name))
        print("name = \(user.name)")
        
        // 6.在 Swift 3 中，π 提供了 Float，Double 与 CGFloat 三种形式（Float.pi、Double.pi、CGFloat.pi），所以求周长还可以这么写
        let r = 3.0
        let circumference = 2 * Double.pi * r
        /*
         Binary operator '*' cannot be applied to operands of type 'CGFloat' and 'Double'
        */
//        let circumference1 = 2 * CGFloat.pi * r
//        let circumference2 = 2 * Float.pi * r
          let circumference3 = 2 * .pi * r
        
        print("circumference = \(circumference)")
        print("circumference3 = \(circumference3)")
        
        // 7.简化GCD的写法
        let queue = DispatchQueue(label: "swift3")
        queue.async {
            print("简化GCD的写法")
        }
        
        // 8.数组排序：sort()与sorted()
        /*
         sort() 是直接对目标数组进行排序。sorted() 是返回一个排序后的数组，原数组不变。
         */
        var array = [1.5, 3, 4, 9, 2, 5]
        array.sort()
        print(array)
        let sortedArray = array.sorted()
        print(array)
        print(sortedArray)
        
        // 9.reversed()与enumerated()过去 reverse() 方法实现数组反转，enumerate() 方法实现遍历。现这两个方法都加上 ed 后缀（reversed、enumerated）
        for i in (1...10).reversed() {
            print(i)
        }
        
        let arr = [1, 3, 5, 6, 2, 4]
        for (index,value) in arr.enumerated() {
            
            print("index \(index)  value = \(value)")
        }
        
        // 10.@discardableResult
           //在 Swift 3 中，如果一个方法有返回值。而调用的时候没有接收该方法的返回值，Xcode 会报出警告，告诉你这可能会存在潜在问题。
        sum(a: 3, b: 4)
    }
    
    @discardableResult
    func sum(a: Int, b: Int) -> Int {
    
        return a + b
    }
    
    func add(a: String) {
        
        print("a = \(a)")
    }
}

class User: NSObject {
    var name: String?
    var age: Int?
}
