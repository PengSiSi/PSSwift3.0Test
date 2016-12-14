//
//  PresentVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/14.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class PresentVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "A页面"
        view.backgroundColor = UIColor.yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc1 = ViewController1()
        self.navigationController?.present(vc1, animated: true, completion: nil)
    }
}
