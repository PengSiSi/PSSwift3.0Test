//
//  OptionalViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/10.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class OptionalViewController: BaseViewController {

    // 访问控制
    private var name: String?
    public var name1: String?
    internal var name2: String?
    fileprivate var name3: String?
    open var name4: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let join = Personn()
        /*
        let roomCount = join.residence?.numberOfRoos
        print(roomCount)  // 打印nil
        */
        if let roomCount = join.residence?.numberOfRoos {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // 输出: Unable to retrieve the number of rooms.
    }
    
    func test() {
        
        print(name ?? "88") // name,name1,2,3,4
    }
}

class Personn {
    var residence: Residence?
}

class Residence {
    var numberOfRoos = 1
}

extension OptionalViewController {
    
    func test1() {
        // 可以访问name1,2,3,4
    }
}
