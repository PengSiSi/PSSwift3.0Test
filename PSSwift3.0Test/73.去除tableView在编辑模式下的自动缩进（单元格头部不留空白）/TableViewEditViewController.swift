//
//  TableViewEditViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/30.
//  Copyright © 2017年 思 彭. All rights reserved.

// 当表格 tableview 进入到编辑状态时，单元格内容会自动向右缩进，这样留出的空间可以用来显示新增或删除按钮图标
// 如果我们只需要单元格拖动排序功能，而不要前面的图标，可以在 editingStyleForRowAt 委托方法中返回 none 即可。不过单元格的缩进仍然存在，左侧还是会有多余的空白区域。


import UIKit

class TableViewEditViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate{

    var tableView: UITableView?
    var ctrlnames: [String] = ["UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //创建表视图
        self.tableView = UITableView(frame: self.view.frame,
                                     style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //绑定对长按的响应
        let longPress =  UILongPressGestureRecognizer(target:self,
                                                      action:#selector(tableviewCellLongPressed(gestureRecognizer:)))
        //代理
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        //将长按手势添加到需要实现长按操作的视图里
        self.tableView!.addGestureRecognizer(longPress)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
                as UITableViewCell
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell.textLabel?.text = self.ctrlnames[indexPath.row]
            return cell
    }
    
    //长按表格
    func tableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizerState.ended)
        {
            print("UIGestureRecognizerStateEnded")
            //在正常状态和编辑状态之间切换
            if(self.tableView!.isEditing == false){
                self.tableView!.setEditing(true, animated:true)
            }
            else{
                self.tableView!.setEditing(false, animated:true)
            }
        }
    }
    
    //单元格的编辑样式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)
        -> UITableViewCellEditingStyle {
            return .none
    }
    
    //去除编辑模式下的头部缩进
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt
        indexPath: IndexPath) -> Bool {
        return false
    }
    
    //在编辑状态，可以拖动设置cell位置
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //移动cell事件
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        if sourceIndexPath != destinationIndexPath{
            //获取移动行对应的值
            let itemValue:String = ctrlnames[sourceIndexPath.row]
            //删除移动的值
            ctrlnames.remove(at: sourceIndexPath.row)
            //如果移动区域大于现有行数，直接在最后添加移动的值
            if destinationIndexPath.row > ctrlnames.count{
                ctrlnames.append(itemValue)
            }else{
                //没有超过最大行数，则在目标位置添加刚才删除的值
                ctrlnames.insert(itemValue, at:destinationIndexPath.row)
            }
        }
    }
}
