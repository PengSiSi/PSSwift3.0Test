//
//  ViewController1.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/14.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ViewController1: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "B页面"
        view.backgroundColor = UIColor.green
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc2 = ViewController2()
        self.present(vc2, animated: true, completion: nil)
    }
}
