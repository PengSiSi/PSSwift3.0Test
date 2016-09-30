//
//  TableViewDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class TableViewDemo: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // 初始数据
    var fontNames = ["PingFangSC-Medium",
                     "EuphemiaUCAS-Italic",
                     "EuphemiaUCAS"]
    var fontRowIndex = 0;
    let tableView = UITableView()
    let suspendButton = UIButton(type: UIButtonType.custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TableView的简单使用";
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isTranslucent = false
        // 注意添加的顺序和视图的层次结构
        createTableView()
        createSuspendButton()
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fontNames.count
    }
    // 创建cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let text = fontNames[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        return cell
    }
    // 行数
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    // 点击单元格
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("你点击了第\(indexPath.row)行!!!")
      }
 }

// MARK: - 设置页面

extension TableViewDemo{
    
    // 创建悬浮按钮
    func createSuspendButton() {
     
        suspendButton.frame = CGRect(x: k_ScreenWidth - 90, y: k_ScreenHeight - 70 - 64, width: 70, height: 70)
        suspendButton.backgroundColor = UIColor.red
        suspendButton.layer.cornerRadius = 35
        suspendButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        suspendButton.setTitle("改变字体", for: .normal)
        suspendButton.addTarget(self, action: #selector(changeFontSize), for: .touchUpInside)
        view .addSubview(suspendButton)
        // 要view放在最前面才能显示,默认是在下面
        self.view.bringSubview(toFront: suspendButton)
    }
    
    func changeFontSize(){
        
        fontRowIndex = (fontRowIndex + 1) % 3
        tableView.reloadData()
    }
    
    // 创建表视图
    func createTableView() {
       
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    
}
