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
                               "26:MJRefresh的使用",
                               "27:扩展UIColor，增加随机颜色属性",
                               "28:UIWebView实现下拉刷新",
                               "29:时间轴效果的实现",
                               "30:实现图片的模糊效果(高斯模糊滤镜)",
                               "31:FrameWork的制作与使用",
                               "32:继承UIView，重写DrawRect",
                               "33:CoreGraphicsFramework学习一",
                               "34:CoreGraphicsFramework学习二",
                               "35:UIViewPropertyAnimatorDemo做动画",
                               "36:UISearchBar使用",
                               "37:日期的比较使用",
                               "38:多图片动画效果",
                               "39:仿京东心跳动画",
                               "40:PresentViewController的使用",
                               "41:自定义UIPickView",
                               "42:封装打印日志信息",
                               "43:获取空间大小",
                               "44:Protocol的使用",
                               "45:CAShapeLayer学习",
                               "46:基础练习",
                               "47:浮点数的求余,求模",
                               "48:FMDB数据库操作",
                               "49:CollectionView间距1px",
                               "50:实现一个圆形数字标签组件",
                               "51:Swift3隐藏状态栏",
                               "52:使用ContactsUI访问通讯录",
                               "53:计步器CMPedometer的使用",
                               "54:设置UILabel、UITextView的文字行间距",
                               "55:判断访问权限没有提示跳转到设置页",
                               "56:在字符串中查找子串首次出现的位置",
                               "57:字符和字符串的学习",
                               "58:集合类型",
                               "59:控制流",
                               "60:实现URL字符串的编码与解码"
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
        if indexPath.row == 26 {
            let colorDemo  = ColorViewController()
            self.navigationController?.pushViewController(colorDemo, animated: true)
        }
        if indexPath.row == 27 {
            let webViewDemo  = WebViewController()
            self.navigationController?.pushViewController(webViewDemo, animated: true)
        }
        if indexPath.row == 28 {
            let TimeLineDemo  = TimeLineViewController()
            self.navigationController?.pushViewController(TimeLineDemo, animated: true)
        }
        if indexPath.row == 29 {
            let imageBlureDemo  = ImageBlureViewController()
            self.navigationController?.pushViewController(imageBlureDemo, animated: true)
        }
        if indexPath.row == 30 {
            let frameWorkDemo  = FrameworkDemo ()
            self.navigationController?.pushViewController(frameWorkDemo, animated: true)
        }
        if indexPath.row == 31 {
            let drawDemo  = DrawViewController ()
            self.navigationController?.pushViewController(drawDemo, animated: true)
        }
        if indexPath.row == 32 {
            let coreGraphicsDemo  = CoreGraphicsViewController ()
            self.navigationController?.pushViewController(coreGraphicsDemo, animated: true)
        }
        if indexPath.row == 33 {
            let coreGraphics1Demo  = CoreGraphicsViewController2 ()
            self.navigationController?.pushViewController(coreGraphics1Demo, animated: true)
        }
        if indexPath.row == 34 {
            let animationDemo  = UIViewPropertyAnimatorDemo()
            self.navigationController?.pushViewController(animationDemo, animated: true)
        }
        if indexPath.row == 35 {
            let searchBarDemo  = SearchBarViewController()
            self.navigationController?.pushViewController(searchBarDemo, animated: true)
        }
        if indexPath.row == 36 {
            let dateDemo  = DateViewController()
            self.navigationController?.pushViewController(dateDemo, animated: true)
        }
        if indexPath.row == 37 {
            let imageAnimationDemo  = ImageAnimationVC()
            self.navigationController?.pushViewController(imageAnimationDemo, animated: true)
        }
        if indexPath.row == 38 {
            let heartAnimationDemo  = HeartAnimationVC()
            self.navigationController?.pushViewController(heartAnimationDemo, animated: true)
        }
        if indexPath.row == 39 {
            let presentDemo  = PresentVC()
            self.navigationController?.pushViewController(presentDemo, animated: true)
        }
        if indexPath.row == 40 {
            let pickViewDemo  = PickViewController()
            self.navigationController?.pushViewController(pickViewDemo, animated: true)
        }
        if indexPath.row == 41 {
            let printLogDemo  = PrintLogViewController()
            self.navigationController?.pushViewController(printLogDemo, animated: true)
        }
        if indexPath.row == 42 {
            let getSpaceSizeDemo  = GetSpaceSizeViewController()
            self.navigationController?.pushViewController(getSpaceSizeDemo, animated: true)
        }
        if indexPath.row == 43 {
            let protocolDemo  = ProtocolViewController()
            self.navigationController?.pushViewController(protocolDemo, animated: true)
        }
        if indexPath.row == 44 {
            let caShapeLayerDemo  = CAShapeLayerDemo()
            self.navigationController?.pushViewController(caShapeLayerDemo, animated: true)
        }
        if indexPath.row == 45 {
            let testDemo  = TestViewController()
            self.navigationController?.pushViewController(testDemo, animated: true)
        }
        if indexPath.row == 46 {
            let floatDemo  = FloatViewController()
            self.navigationController?.pushViewController(floatDemo, animated: true)
        }
        if indexPath.row == 47 {
            let fmdbDemo  = FMDBViewController()
            self.navigationController?.pushViewController(fmdbDemo, animated: true)
        }
        if indexPath.row == 48 {
            let collectionViewDemo  = MyCollectionViewVCCollectionViewController()
            self.navigationController?.pushViewController(collectionViewDemo, animated: true)
        }
        if indexPath.row == 49 {
            let counterLabelDemo  = CounterLabelViewController()
            self.navigationController?.pushViewController(counterLabelDemo, animated: true)
        }
        if indexPath.row == 50 {
            let statuslDemo  = HideStatusViewController()
            self.navigationController?.pushViewController(statuslDemo, animated: true)
        }
        if indexPath.row == 51 {
            let contactDemo  = ContactViewController()
            self.navigationController?.pushViewController(contactDemo, animated: true)
        }
        if indexPath.row == 52 {
            let cmpendometerDemo  = CMPendometer()
           self.navigationController?.pushViewController(cmpendometerDemo, animated: true)
        }
        if indexPath.row == 53 {
            let textSpaceDemo  = TextLineSpaceVC()
            self.navigationController?.pushViewController(textSpaceDemo, animated: true)
        }
        if indexPath.row == 54 {
            let jumpSettingDemo  = JumpSettingVC()
            self.navigationController?.pushViewController(jumpSettingDemo, animated: true)
        }
        if indexPath.row == 55 {
            let stringPositionDemo  = StringPositionVC()
            self.navigationController?.pushViewController(stringPositionDemo, animated: true)
        }
        if indexPath.row == 56 {
            let strDemo  = StringDemo()
            self.navigationController?.pushViewController(strDemo, animated: true)
        }
        if indexPath.row == 57 {
            let collectionDemo  = CollectionDemo()
            self.navigationController?.pushViewController(collectionDemo, animated: true)
        }
        if indexPath.row == 58 {
            let controlStreamDemo = ControlStreamVC()
            self.navigationController?.pushViewController(controlStreamDemo, animated: true)
        }
        if indexPath.row == 59 {
            let urlCodeDemo = UrlCodeViewController()
            self.navigationController?.pushViewController(urlCodeDemo, animated: true)
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

