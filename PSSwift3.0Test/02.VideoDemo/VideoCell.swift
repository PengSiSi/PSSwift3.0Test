//
//  VideoCell.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

// 定义block,传递播放按钮的事件  <无参数,无返回值>
typealias videoPlayButtonClick = () -> ()

class VideoCell: UITableViewCell {

    var model: VideoModel?{
        
        didSet{
            titleLabel.text = model?.title
            bgImgView.image = UIImage(named: (model?.image)!)
            sourceLabel.text = model?.source
        }
    }
    
    @IBOutlet weak var bgImgView: UIImageView!
    @IBAction func playButtonClick(_ sender: AnyObject) {
        
        print("开始播放")
        if (playBlock != nil) {
            playBlock!()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    // 创建block实例
    var playBlock: videoPlayButtonClick?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
    
}
