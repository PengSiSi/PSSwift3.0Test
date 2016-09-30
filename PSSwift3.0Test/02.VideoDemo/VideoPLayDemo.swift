//
//  VideoPLayDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPLayDemo: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataAray: [VideoModel] = []
    let cellId = "VideoCellID" //获取CellId
    let tableView = UITableView()
    
    // 创建播放器
    var playVc = AVPlayerViewController()
    var playView = AVPlayer()
    let playerVideoButton = UIButton(type: UIButtonType.custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "系统视频播放器"
        view.backgroundColor = UIColor.white
        loadData()
        createTableView()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! VideoCell
        cell.selectionStyle = .none
        cell.model = dataAray[indexPath.row]
       
        // block回调  播放视频
        cell.playBlock = {
            
            let path = Bundle.main.path(forResource: "movie", ofType: "mp4")
            self.playView = AVPlayer(url: URL(fileURLWithPath: path!))
            self.playVc.player = self.playView
            self.present(self.playVc, animated: true, completion: { 
                
                self.playVc.player?.play()
            })
        }
        return cell
    }
    // 行数
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 204
    }
    // 点击单元格
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("你点击了第\(indexPath.row)行!!!")
    }
  }

// 数据处理

extension VideoPLayDemo{
    
    func loadData() {
        
        let imgArray = ["videoScreenshot01","videoScreenshot02","videoScreenshot03","videoScreenshot04","videoScreenshot05","videoScreenshot06"]
        let titleArray = ["Introduce 3DS Mario","Emoji Among Us","Seals Documentary","Adventure Time","Facebook HQ","Lijiang Lugu Lake"]
        let resourceArray = ["Youtube - 06:32","Vimeo - 3:34","Vine - 00:06","Youtube - 02:39","Facebook - 10:20","Allen - 20:30"]
        for i in 0..<6{
            let videoModel = VideoModel()
            videoModel.image = imgArray[i]
            videoModel.title = titleArray[i]
            videoModel.source = resourceArray[i]
            dataAray.append(videoModel)
        }
        tableView.reloadData()
    }
}

// 设置界面
extension VideoPLayDemo{
    
    func createTableView(){
        
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        // 注册cell
        tableView.register(UINib.init(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
}
