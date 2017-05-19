//
//  ModelViewModel.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/5/18.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class ModelViewModel: NSObject, TableViewCellProtocol {
    
    var title = "siis"
    var imageName = "img2.jpg"
    
    init(model: AccountModel) {
        
        let title = "sisi" + "棒棒哒"
        self.title = title
    }
}
