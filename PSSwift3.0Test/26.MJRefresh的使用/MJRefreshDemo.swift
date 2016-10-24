//
//  MJRefreshDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/24.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import MJRefresh

class MJRefreshDemo: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var items:[String]! //数据源
    var tableView:UITableView?  // 表视图
    
    override func viewDidLoad() {
        super.viewDidLoad()

        items = Array()
        setTableView()
        refreshItemData()
        
        // 1.顶部刷新
        let header = MJRefreshNormalHeader()
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        // 隐藏时间
//        header.lastUpdatedTimeLabel.isHidden = true
        // 隐藏状态
//        header.stateLabel.isHidden = true
        
        //修改文字
        header.setTitle("下拉下拉下拉", for: .idle)
        header.setTitle("松开松开松开", for: .pulling)
        header.setTitle("刷新刷新刷新", for: .refreshing)
        
        //修改字体
        header.stateLabel.font = UIFont.systemFont(ofSize: 15)
        header.lastUpdatedTimeLabel.font = UIFont.systemFont(ofSize: 13)
        
        //修改文字颜色
        header.stateLabel.textColor = UIColor.red
        header.lastUpdatedTimeLabel.textColor = UIColor.blue
        
        self.tableView!.mj_header = header
        
        // 2.使用闭包实现底部加载
        self.tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { 
            
            sleep(2)
            // 闭包里面要使用self调用函数
            self.refreshItemData()
            self.tableView?.reloadData()
            self.tableView?.mj_header.endRefreshing()
        })
    }
    
    //初始化数据
    func refreshItemData() {
//        items = []
        for _ in 0...9 {
            items.append("条目\(Int(arc4random()%100))")
        }
    }
    
    // 上拉加载
    func addRefresh() {
        
        sleep(2)
        refreshItemData()
        self.tableView?.reloadData()
        self.tableView?.mj_header.endRefreshing()
    }
    
    // 下拉刷新
    func headerRefresh() {
        
        sleep(2)
        refreshItemData()
        self.tableView?.reloadData()
        self.tableView?.mj_header.endRefreshing()
    }
    
    // 设置表视图
    func setTableView() {
        
        self.tableView = UITableView (frame: self.view.bounds, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view .addSubview(self.tableView!)
        
        // 加上这句代码设置就会出现野指针????
//        self.tableView?.tableFooterView = UIView (frame: CGRect.zero)
        // 注册cell
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // 代理和数据源方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
}
