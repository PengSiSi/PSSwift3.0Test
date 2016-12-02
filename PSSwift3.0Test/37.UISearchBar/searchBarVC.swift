//
//  searchBarVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class searchBarVC: BaseViewController {

    var searchVc: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UISearchControlle的使用"
        // 配置搜索控制器
        self.searchVc = ({
            
            let searchVc = UISearchController(searchResultsController: nil)
            searchVc.hidesNavigationBarDuringPresentation = true
            searchVc.dimsBackgroundDuringPresentation = false
            searchVc.searchBar.searchBarStyle = .minimal
            searchVc.searchBar.sizeToFit()
            return searchVc
        })()
        
        let searchContainer = UIView(frame: CGRect(x: 0, y: 64, width: k_ScreenWidth, height: 44))
        searchContainer.addSubview(searchVc.searchBar)
        self.view.addSubview(searchContainer)
        
        // 改变取消文字显示
        searchVc.searchBar.setValue("搜索", forKey: "_cancelButtonText")
//        searchVc.searchBar.setValue(UIColor.green, forKey: "_cancelButtonTextcolor")
    }
}
