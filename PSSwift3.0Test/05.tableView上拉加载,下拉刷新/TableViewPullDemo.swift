//
//  TableViewPullDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/26.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class TableViewPullDemo: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    // 表视图
    var tableView: UITableView!
    // 存数据数组
    var dataArray = [String]()
    //表格底部用来提示数据加载的视图
    var loadMoreView: UIView?
    var activityIndicator: UIActivityIndicatorView?
    //计数器（用来做延时模拟网络加载效果）
    var timer: Timer!
    //用了记录当前是否允许加载新数据（正则加载的时候会将其设为false，放置重复加载）
    var loadMoreEnable = true
    // 下拉刷新控件
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableView上拉加载,下拉刷新"
        view.backgroundColor = UIColor.white
        // 自己初始化方法
//        loadData()
        
        // 开始刷新
        refreshControl?.beginRefreshing()
        setupScrollingView()
        createTableView()
        addRefreshControl()
        // 第一次加载数据
        loadMoreData()
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    // 创建cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = self.dataArray[indexPath.row]
        
        // 当下拉到底部,执行加载数据
        if loadMoreEnable && indexPath.row == self.dataArray.count - 1{
            
            loadMoreData()
        }
        return cell
    }
}

// 设置界面

extension TableViewPullDemo {
    
    func createTableView() {
        
        tableView = UITableView (frame: CGRect(x: 0, y: 0, width: k_ScreenWidth, height: k_ScreenHeight))
        // 注意是self调用
        self.automaticallyAdjustsScrollViewInsets = true
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = loadMoreView
        view.addSubview(tableView)
    }
    
     //上拉刷新视图
    func setupScrollingView() {
     
        loadMoreView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        // 宽度自适应
        loadMoreView?.autoresizingMask = .flexibleWidth
        loadMoreView?.backgroundColor = UIColor.orange
        // 中间加载进度条
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator?.color = UIColor.darkGray
        let x = (self.loadMoreView?.frame.size.width)! / 2 - (activityIndicator?.frame.size.width)! / 2
        let y = (self.loadMoreView?.frame.size.height)! / 2 - (activityIndicator?.frame.size.height)! / 2
        activityIndicator?.frame = CGRect(x: x, y: y, width: (activityIndicator?.frame.size.width)!, height: (activityIndicator?.frame.size.height)!)
        // 开启
//        activityIndicator?.startAnimating()
        loadMoreView?.addSubview(activityIndicator!)
    }
    
    func addRefreshControl() {
        
        refreshControl = UIRefreshControl()
        // 添加刷新  -- 当值发生变化时触发
        refreshControl?.addTarget(self, action: #selector(refreshData), for:.valueChanged)
        refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        tableView.addSubview(refreshControl!)
    }
    
    // 刷新数据
    func refreshData() {
        
        // 移除老数据
//        dataArray.removeAll()
         //随机添加5条新数据（时间是当前时间）
        for i in 0 ..< 5{
//            dataArray.append("新闻标题\(i)")
            // 每次讲数据插入到数组最前面
            dataArray.insert("新闻标题\(i)", at: 0)
        }
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
}

extension TableViewPullDemo {
    
    func loadMoreData() {
        
        activityIndicator?.startAnimating()
        print("加载新数据!")
        loadMoreEnable = false
//        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(TableViewPullDemo.timeOut), userInfo: nil, repeats: true)
        // 注意: 定义定时器,上面方法不能触发,一定要下面的方法!!!
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,
                                                       selector: #selector(TableViewPullDemo.timeOut), userInfo: nil, repeats: true)
    }

    func timeOut() {
    
        print("新数据来啦!!")
        setupScrollingView()
        let start = self.dataArray.count + 1
        //随机添加10条新数据（时间是当前时间）
        for i in start ..< start + 20{
            self.dataArray.append("思思,加油!\(i)")
        }
        // 刷新表视图
        tableView.reloadData()
        loadMoreView?.removeFromSuperview()
        loadMoreView = nil
        activityIndicator?.stopAnimating()
        loadMoreEnable = true
        
        // 定时器停止,销毁
//        timer.invalidate()
//        timer = nil
    }
    
    // 初始化数据
    func loadData() {
        dataArray = ["思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2","思思最棒2"]
    }
}
