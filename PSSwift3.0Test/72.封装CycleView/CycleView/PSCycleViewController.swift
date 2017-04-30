//
//  PSCycleViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/25.
//  Copyright © 2017年 思 彭. All rights reserved.

// http://bbs.520it.com/forum.php?mod=viewthread&tid=2309 木有实现完

import UIKit

class PSCycleViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let cycleView = CycleView.CycleView()
        cycleView.frame = CGRect(x: 0, y: 100, width: view.width, height: 200)
        cycleView.dataArray = []
        view.addSubview(cycleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
