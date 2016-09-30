//
//  SelectCellExpandDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/28.
//  Copyright © 2016年 思 彭. All rights reserved.

// ??? 问题: 每点击一次,单元格存在复用问题,字体加深

import UIKit

class SelectCellExpandDemo: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView?
    var dataArray: [String] = ["UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图"]
    var selectCellIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "实现点击UITableView单元格时自动展开单元格"
        view.backgroundColor = UIColor.white
        createTableView()
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // label
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        
//        if selectCellIndexPath != nil {
//            label.text = dataArray[selectCellIndexPath.row]
//        }
//        else{
            label.text = dataArray[indexPath.row]
//        }
        // textview
        let textview = UITextView(frame:CGRect.zero)
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textColor = UIColor.gray
        textview.isEditable = false
        textview.text = "UIDatePicker是一个控制器类,封装了UIPickerView,但是他是UIControl的子类"
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        //自动遮罩不可见区域,超出的不显示
        cell.layer.masksToBounds = true
        cell.contentView.addSubview(label)
        cell.contentView.addSubview(textview)
        
        //创建一个控件数组
        let views = ["label": label, "textView":textview]
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[label]-15-|", options: [], metrics: nil, views: views))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[label(40)]", options: [], metrics: nil, views: views))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[textView]-15-|", options: [], metrics: nil, views: views))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[label]-[textView(80)]", options: [], metrics: nil, views: views))
        return cell
    }
    
    // cell的点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView?.deselectRow(at: indexPath, animated: true)
        selectCellIndexPath = indexPath
        
        // 这里点击单元格会重用问题,不应该的呀???
        
//        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
        // 点击不响应是textView的点击事件截获了
    }
    
    //点击单元格会引起cell高度的变化，所以要重新设置
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // 两个条件的顺序问题会导致程序的崩溃
        if selectCellIndexPath != nil && selectCellIndexPath == indexPath {
            
            return 120
        }
        return 40
    }
}

//MARK: - 设置界面

extension SelectCellExpandDemo {
    
    // 创建表视图
    func createTableView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: k_ScreenWidth, height: k_ScreenHeight), style: .plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        view.addSubview(tableView!)
        
        // 注册cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
    }
}
