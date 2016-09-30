//
//  TbaleViewRowHeight.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/26.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class TbaleViewRowHeight: UIViewController,UITableViewDelegate,UITableViewDataSource{

    let tableView: UITableView = UITableView()
    var dataAray = [[String]]()
    let cellId = "rowHeightCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "tableView单元格高度自适应"
        loadData()
        setTableView()
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataAray.count
    }
    // 创建cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RowHeightCell
        cell.selectionStyle = .none
        cell.dataArr = self.dataAray[indexPath.row]
        return cell
    }
    
//    // 行数
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 304
//    }
    // 点击单元格
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("你点击了第\(indexPath.row)行!!!")
    }
}

// 初始化数据

extension TbaleViewRowHeight{
    
    func loadData() {
        
        dataAray.append(["第一节：Swift 环境搭建", "img1.jpg"])
        dataAray.append(["第二节：Swift 基本语法（类型定义、循环遍历、判断、继承）", "img2.jpg"])
        dataAray.append(["第三节：Swift 数据类型", "img3.jpg"])
    }
}

// 设置界面

extension TbaleViewRowHeight{
    
    func setTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: k_ScreenWidth, height: k_ScreenHeight);
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        view.addSubview(tableView)
        
        // <设置下面两条属性高度自适应,iOS8才能使用>
        //设置estimatedRowHeight属性默认值
        tableView.estimatedRowHeight = 200
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        // 注册cell
        tableView.register(UINib.init(nibName: "RowHeightCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
}
