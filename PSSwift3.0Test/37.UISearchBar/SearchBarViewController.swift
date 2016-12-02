//
//  SearchBarViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/1.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SearchBarViewController: BaseViewController {

    var searchBar: UISearchBar!
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar = UISearchBar()
        searchBar?.frame = CGRect(x: 0, y: 64, width: k_ScreenWidth, height: 44)
        searchBar?.barTintColor = UIColor.lightGray
        view.addSubview((searchBar)!)
        
        // 下面设置不知道为什么无效？ fatal error: unexpectedly found nil while unwrapping an Optional value
        
//        let uiButton = searchBar?.value(forKey: "cancelButton") as! UIButton
//        uiButton.setTitle("搜索", for: .normal)
//        uiButton.setTitleColor(UIColor.orange,for: .normal)
        
        setButton()
    }
    
    func setButton() {
        
        button = UIButton(frame: CGRect(x: 80, y: 150, width: 200, height: 30))
        button.backgroundColor = UIColor.green
        button.setTitle("进入下一个demo", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func buttonDidClick() {
       let searchBarDemo = searchBarVC()
       self.navigationController?.pushViewController(searchBarDemo, animated: true)
    }
}
