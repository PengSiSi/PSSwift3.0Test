//
//  TimeLineViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/5.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SnapKit

//消费记录
struct Consumption {
    var title:String //消费条目
    var cost:Double //费用
    var datetime:String //时间
    var appendix:String //备注
}

class TimeLineViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    //所有消费记录
    var consumptions:[Consumption]?
    //使用时间轴形式的表格
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        createTableView()

    }
    
    // 初始化数据
    func initData() {
        
        consumptions = [
            Consumption(title:"充了手机话费", cost:100.0, datetime:"2016.10.10 12:10",
                        appendix:""),
            Consumption(title:"超市购物", cost:810.0, datetime:"2016.10.11 12:10",
                        appendix:"买了台豆浆机，一袋大米，一桶油，两斤苹果，一包饼干，两只牙刷。"),
            Consumption(title:"同事结婚随礼", cost:500, datetime:"2016.10.11 17:10",
                        appendix:""),
            Consumption(title:"办健身卡", cost:1000, datetime:"2016.10.15 11:00",
                        appendix:"有效期至2016年10月")]
    }
    
    func createTableView() {
       
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style:UITableViewStyle.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(TimeLineCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //让单元格自适应
        tableView!.rowHeight = UITableViewAutomaticDimension
        tableView!.estimatedRowHeight = 100
        tableView!.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView!.tableFooterView = UIView()
    }
    
    //在本例中，只有一个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.consumptions!.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let identifier = "SwiftCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
                as? TimeLineCell
            if cell == nil{
                cell = TimeLineCell(style: .default, reuseIdentifier: identifier)
                cell?.selectionStyle = .none
            }
            //获取记录
            let consumption = self.consumptions![indexPath.row]
            //设置时间轴上的图标
            cell!.timeLineIcon.image = UIImage(named: "money")
            //设置消费金额
            cell!.costLabel.text = "\(consumption.cost) 元"
            //设置消费时间
            cell?.dateTimeLabel.text = consumption.datetime
            //设置消费内容
            cell?.titleLabel.text = consumption.title
            //设置备注信息
            cell?.appendixLabel.text = consumption.appendix
            //设置是否有备注（自动更新备注标签容器相关约束）
            cell?.hasAppendix = (cell?.appendixLabel.text != "")
            return cell!
    }
}
