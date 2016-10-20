//
//  SearchController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/19.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SearchController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var countrySearchController: UISearchController?
    //原始数据集
    let schoolArray = ["清华大学","北京大学","中国人民大学","北京交通大学","北京工业大学",
                       "北京航空航天大学","北京理工大学","北京科技大学","中国政法大学",
                       "中央财经大学","华北电力大学","北京体育大学","上海外国语大学","复旦大学",
                       "华东师范大学","上海大学","河北工业大学"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "带搜索框的UITableViewController"
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isTranslucent = false
        //配置搜索控制器
        self.countrySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            // 这句代码不知道为什么不能设置,报错
//            controller.searchResultsUpdater = self
            // 注意设置导航栏的不隐藏,不然还是会出问题
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            return controller
        })()
        
        //将搜索栏添加到页面上
        let searchBarFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        countrySearchController?.searchBar.frame = searchBarFrame
        let searchBarContainer = UIView(frame: searchBarFrame)
      searchBarContainer.addSubview((countrySearchController?.searchBar)!)
        self.view.addSubview(searchBarContainer)
        // 创建表视图
        self.tableView = UITableView(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: self.view.frame.height - 64), style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.showsVerticalScrollIndicator = false
        self.view.addSubview(self.tableView!)
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    // 创建cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = schoolArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.red
        return cell
    }
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.00001
    }
}
