//
//  GetSpaceSizeViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/16.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class GetSpaceSizeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       let size = SpaceSizeTool.shareInstance.getDiskSpaceFreeSize()
       print("size = \(size)")
       let showString = SpaceSizeTool.shareInstance.diskSpaceFreeSizeString(size: size)
        print("showString = \(showString)")
    }
}
