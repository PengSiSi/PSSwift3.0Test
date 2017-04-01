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
        
        // 一.数组
        
        // 创建一个空数组
        let someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        
        // 创建一个带有默认值的数组  threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
       let threeDoubles = [Double](repeating:0.0, count: 3)
       
        // 数组的合并,必须是同一类型的数组
       _ = threeDoubles + threeDoubles
        
        // 用字面量构造数组
        var shoppingList: [String] = ["apple", "orange", "banner", "banner","banner"]
        
        // 访问和修改数组
        _ = shoppingList.count
        
        // 使用布尔值属性isEmpty作为检查count属性的值是否为 0 的捷径
        if shoppingList.isEmpty {
            print("shoppingList is empty")
        }
        
        // 数组后面添加新的数据项
        shoppingList.append("sisi")
        
        // 加法赋值运算符（+=）也可以直接在数组后面添加
        shoppingList += ["aa a"]
        
        //下标语法来获取数组中的数据项
        _ = shoppingList[0]
        
        // 利用下标来一次改变一系列数据值  (修改0.1.2.3.4下标的值)
        shoppingList[0...4] = ["1", "2", "3", "4","5"]
        print(shoppingList)
     
        // 添加数据项
        shoppingList.insert("100", at: 0)
        shoppingList.remove(at: 0)
        shoppingList.removeLast()
        shoppingList.removeFirst()
        
        // 数组的遍历
        for item in shoppingList {
            print(item)
        }
        
        // 需要每个数据项的值和索引值，可以使用enumerate()方法来进行数组遍历 enumerate()返回一个由每一个数据项索引值和数据值组成的元组
        for (index, value) in shoppingList.enumerated() {
            print("index = \(index),value = \(value)")
        }
        
        // 二.集合Sets
        // 创建和构造一个空的集合,Character类型
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        letters.insert("s")
        letters = []
        
        // 用数组字面量创建集合 String类型
        var letter2: Set<String> = ["Rock", "Classical", "Hip hop"]
        print(letter2)
        
        var letter3: Set = ["1", "2", "3"]
        print(letter3)
        
        // 访问和修改一个集合
        // count
        print("I have \(letter3.count) favorite music genres.")
        
        // 判空
        if letter3.isEmpty {
            
            print("letter3 is empty")
        }
        
        // 添加一个新元素
        letter3.insert("ssss")
        
        // 删除元素
        letter3.removeFirst()
        letter3.removeAll()
        
        // 包含
        if letter3.contains("Rock") {
            print("contain")
        }
        
        // 遍历一个集合
        for item in letter3 {
            print(item)
        }
        
        var letter4: Set = ["Rock", "Classical", "Hip hop"]
        // 元素排列顺序  升序排序
        for item in letter4.sorted() {
            print(item)
        }
        
        // 集合操作
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        
        // 1.合并创建的一个新的集合
        let sum1 = oddDigits.union(evenDigits)
        
        // 2.根据两个集合中都包含的值创建的一个新的集合
        let sum2 = oddDigits.intersection(evenDigits)
        
        // 根据在一个集合中但不在两个集合中的值创建一个新的集合
        let sum4 =  oddDigits.symmetricDifference(singleDigitPrimeNumbers)
        
        // 集合成员关系和相等
        if oddDigits.isSubset(of: evenDigits) {
            print("一个集合中的值是也被包含在另外一个集合中")
        }
        if oddDigits.isSuperset(of: evenDigits) {
            print("一个集合中包含另一个集合中所有的值")
        }
        if oddDigits.isStrictSubset(of: evenDigits) {
            print("一个集合是是另外一个集合的子集合")
        }
        if oddDigits.isSuperset(of: evenDigits) {
            print("父集合并且两个集合并不相等")
        }
        if oddDigits.isDisjoint(with: evenDigits) {
            print("两个集合是不含有相同的值(是否没有交集)")
        }
        
        // 三.字典
        // 创建一个空字典
        var numOfIntegers = [Int: String]()
        numOfIntegers[0] = "zero"
        numOfIntegers = [:]
        
        // 用字典字面量创建字典
        var dic: [String: String] = ["a" : "1",
                                     "b" : "2"]
        // 访问和修改字典
         _ = numOfIntegers.count
        
        if numOfIntegers.isEmpty {
            print("dic is empty...")
        }
        
        // updateValue
//        if let oldValue = numOfIntegers.updateValue("sisi", forKey: "DUB") {
//            print("The old value for DUB was \(oldValue).")
//            
//        }
        numOfIntegers.removeValue(forKey: 1)
        print(numOfIntegers)
        
        // 字典遍历
        for (k, value) in numOfIntegers {
            print("key = \(k) value = \(value)")
        }
         _ = numOfIntegers.keys
        _ = numOfIntegers.values
        
    }
}
