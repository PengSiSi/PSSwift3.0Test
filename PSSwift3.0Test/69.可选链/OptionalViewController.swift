//
//  OptionalViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/10.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class OptionalViewController: BaseViewController {

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
}

class Personn {
    var residence: Residence?
}

class Residence {
    var numberOfRoos = 1
}
