//
//  ViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let dataArray: [String] = ["1：tableView简单用法",
                               "2：调用系统视频播放器",
                               "3：scrollView简单用法",
                               "4: tableView单元格高度自适应",
                               "5: tableView上拉加载,下拉刷新",
                               "6: CollectionView的基本使用",
                               "7: CustomLayout实现复杂布局",
                               "8: 实现毛玻璃效果",
                               "9: UIButton点击切换title",
                               "10:使用AVFoundation实现条形码扫描",
                               "11:代理的使用",
                               "12:单例的使用",
                               "13:通过url地址打开web页面",
                               "14:实现点击UITableView单元格时自动展开单元格",
                               "15:GCD的基本使用",
                               "16:使用UIWebView和UIToolbar制作一个浏览器",
                               "17:微调器或叫步进器（UIStepper）的用法",
                               "18:网络请求",
                               "19:数据解析,JSON转Model",
                               "20:SnapKit的使用",
                               "21:Swift修饰符的使用",
                               "22:Swift3新特性汇总",
                               "23:带搜索框的UITableViewController",
                               "24:页面传值",
                               "25:Swift结构体指针操作",
                               "26:MJRefresh的使用"
                              ];
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "思思的Swift3.0的学习"
        setupTableView()
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
        let text = dataArray[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    // 行数
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    // 点击单元格
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("你点击了第\(indexPath.row)行!!!")
        if indexPath.row == 0 {
            let tableViewDemo = TableViewDemo()
            self.navigationController?.pushViewController(tableViewDemo, animated: true)
        }
        if indexPath.row == 1 {
            let videoPlayDemo = VideoPLayDemo()
            self.navigationController?.pushViewController(videoPlayDemo, animated: true)
        }
        if indexPath.row == 2 {
            let scrollViewDemo = ScrollViewDemo()
            self.navigationController?.pushViewController(scrollViewDemo, animated: true)
        }
        if indexPath.row == 3 {
            let tableRowHeightDemo = TbaleViewRowHeight()
            self.navigationController?.pushViewController(tableRowHeightDemo, animated: true)
        }
        if indexPath.row == 4 {
            let tablePullDemo = TableViewPullDemo()
            self.navigationController?.pushViewController(tablePullDemo, animated: true)
        }
        if indexPath.row == 5 {
            let colectionViewDemo = CollectionViewDemo()
            self.navigationController?.pushViewController(colectionViewDemo, animated: true)
        }
        if indexPath.row == 6 {
            let customlayoutDemo = CustomLayoutVc()
            self.navigationController?.pushViewController(customlayoutDemo, animated: true)
        }
        if indexPath.row == 7 {
            let blurEffectDemo = UIBlurEffectDemo()
            self.navigationController?.pushViewController(blurEffectDemo, animated: true)
        }
        if indexPath.row == 8 {
            let buttonChangeTitleDemo = BUttonChangeTitleDemo()
           self.navigationController?.pushViewController(buttonChangeTitleDemo, animated: true)
        }
        if indexPath.row == 9 {
            let scannerDemo = ScannerDemo()
           self.navigationController?.pushViewController(scannerDemo, animated: true)
        }
        if indexPath.row == 10 {
            let delegateDemo = DelegateDemo()
            self.navigationController?.pushViewController(delegateDemo, animated: true)
        }
        if indexPath.row == 11 {
            let singleDemo = SingleInstanceDemo()
            self.navigationController?.pushViewController(singleDemo, animated: true)
        }
        if indexPath.row == 12 {
            let openUrlDemo = OpenUrlDemo()
            self.navigationController?.pushViewController(openUrlDemo, animated: true)
        }
        if indexPath.row == 13 {
            let expandCellDemo = SelectCellExpandDemo()
            self.navigationController?.pushViewController(expandCellDemo, animated: true)
        }
        if indexPath.row == 14 {
            let gcdDemo = GCDDemo()
            self.navigationController?.pushViewController(gcdDemo, animated: true)
        }
        if indexPath.row == 15 {
            let webViewDemo = UIWebViewDemo()
            self.navigationController?.pushViewController(webViewDemo, animated: true)
        }
        if indexPath.row == 16 {
            let stepperDemo = UIStepperDemo()
            self.navigationController?.pushViewController(stepperDemo, animated: true)
        }
        if indexPath.row == 17 {
            let netWorkDemo = NetworkingDemo()
            self.navigationController?.pushViewController(netWorkDemo, animated: true)
        }
        if indexPath.row == 18 {
            let swiftJsonDemo = SwiftJSONDemo()
            self.navigationController?.pushViewController(swiftJsonDemo, animated: true)
        }
        if indexPath.row == 19 {
            let snapKitDemo = SnapKitDemo()
            self.navigationController?.pushViewController(snapKitDemo, animated: true)
        }
        if indexPath.row == 20 {
            let modifyDemo = ModifierViewController()
            self.navigationController?.pushViewController(modifyDemo, animated: true)
        }
        if indexPath.row == 21 {
            let newDemo = NewPointViewController()
            self.navigationController?.pushViewController(newDemo, animated: true)
        }
        if indexPath.row == 22 {
            let searchDemo = SearchController()
            self.navigationController?.pushViewController(searchDemo, animated: true)
        }
        if indexPath.row == 23 {
            let passValueDemo = PasssValueViewController()
            self.navigationController?.pushViewController(passValueDemo, animated: true)
        }
        if indexPath.row == 24 {
            let structDemo  = StructViewController()
            self.navigationController?.pushViewController(structDemo, animated: true)
        }
        if indexPath.row == 25 {
            let mjrefreshDemo  = MJRefreshDemo()
            self.navigationController?.pushViewController(mjrefreshDemo, animated: true)
        }
    }
}

// MARK: - 设置界面

extension ViewController{
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
    }
}

