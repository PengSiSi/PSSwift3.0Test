//
//  ScrollViewDemo2.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ScrollViewDemo2: UIView,UITableViewDelegate,UITableViewDataSource {

    // 定义block、有返回值
    var rowActionBlock: ((_ tableView: UITableView, _ indexPath: NSIndexPath, _ dataArray: NSArray) -> ())?
    let tableView = UITableView()
    
    var dataArray : [String] = ["DemoVC3_View2 第1行",
                                "DemoVC3_View2 第2行",
                                "DemoVC3_View2 第3行",
                                "DemoVC3_View2 第4行",
                                "DemoVC3_View2 第5行",
                                "DemoVC3_View2 第6行",
                                "DemoVC3_View2 第7行",
                                "DemoVC3_View2 第8行"];
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.autoresizesSubviews = false
        setTableView()
        self.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = .blue
        
        cell.textLabel?.text = self.dataArray[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 点击立刻取消该cell的选中状态
        tableView.deselectRow(at: indexPath, animated: true)
        
        // block的传递事件
        if rowActionBlock != nil
        {
            rowActionBlock!(tableView, indexPath as NSIndexPath, dataArray as NSArray)
        }
    }
}

// MARK: - 设置tableView

extension ScrollViewDemo2{
    
    func setTableView(){
        
        tableView.frame = CGRect(x: 0, y: 64, width: k_ScreenWidth, height: k_ScreenHeight - 64)
        tableView.dataSource = self
        tableView.delegate = self
        self.addSubview(tableView)
        tableView.isScrollEnabled = false
        tableView.separatorColor = UIColor.gray
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
    }
}
