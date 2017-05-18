//
//  TableViewCell.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/5/18.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

// 定义协议
protocol TableViewCellProtocol {
    
    var title: String { get }
    var imageName: String { get }
}

class TableViewCell: UITableViewCell {

    var titleLabel:UILabel?
    var picImgView:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withDelegate delegate: TableViewCellProtocol) {
        
        // 配置cell
        titleLabel?.text = delegate.title
        imageView?.image = UIImage(named: delegate.imageName)
    }
}

extension TableViewCell {
    
    func createSubViews() {
        self.titleLabel = UILabel.init()
        self.titleLabel?.backgroundColor = UIColor.clear;
        self.titleLabel?.frame = CGRect(x:0, y:10, width:100, height:24)
//        self.titleLabel?.text = "Title"
        self.titleLabel?.textColor = UIColor.black
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(self.titleLabel!)
        
        self.picImgView = UIImageView()
        self.picImgView?.frame = CGRect(x:110, y:10, width:50, height:24)
        self.picImgView?.backgroundColor = UIColor.lightGray
//        self.picImgView?.image = UIImage.init(named: "img2.jpg")
        self.contentView.addSubview(self.picImgView!)
    }
}
