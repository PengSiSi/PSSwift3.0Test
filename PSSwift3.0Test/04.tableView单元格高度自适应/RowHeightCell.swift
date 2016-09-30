//
//  RowHeightCell.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/26.
//  Copyright © 2016年 思 彭. All rights reserved.
// 

// 注意: 一旦cell里面计算了宽高比,要注意控制器不要再设置高度了,不然还是显示不正确!!!

import UIKit

class RowHeightCell: UITableViewCell,SDPhotoBrowserDelegate {

    // 标题
    @IBOutlet weak var titleLabel: UILabel!
    // 图片
    @IBOutlet weak var imgView: UIImageView!
    
    //内容图片的宽高比约束
    internal var aspectConstraint: NSLayoutConstraint?{
        didSet {
            if oldValue != nil {
                imgView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                imgView.addConstraint(aspectConstraint!)
            }
        }
    }
    var dataArr:[String]? {
        
        didSet{
            titleLabel.text = dataArr?[0] ?? ""
//            imgView.sd_setImage(with: URL(string: (dataArr?[1])!))
//            imgView.image = UIImage(named: (dataArr?[1])!)
            // 加载图片
            loadImage((self.dataArr?[1])!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapImgView = UITapGestureRecognizer(target: self, action: #selector(clickImgView))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapImgView)
    }
    
    func clickImgView() {
        
        let sdPhotpBrowser = SDPhotoBrowser()
        sdPhotpBrowser.delegate = self
        sdPhotpBrowser.currentImageIndex = 0
        sdPhotpBrowser.imageCount = 1
        sdPhotpBrowser.sourceImagesContainerView = self.contentView
        sdPhotpBrowser.show()
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        //清除内容图片的宽高比约束
        aspectConstraint = nil
    }
    
    // MARK: - SDPhotoBrowserDelegate
    
    func photoBrowser(_ browser: SDPhotoBrowser!, placeholderImageFor index: Int) -> UIImage! {
        
        return UIImage(named: "20160802144546260948.jpeg")
    }
    func photoBrowser(_ browser: SDPhotoBrowser!, highQualityImageURLFor index: Int) -> URL! {
        
        return URL(string: "http://img5.imgtn.bdimg.com/it/u=1027282977,3390056124&fm=21&gp=0.jpg")
    }

}

// 设置图片

extension RowHeightCell{
    
    //加载内容图片（并设置高度约束）
    func loadImage(_ name: String) {
        
        if let image = UIImage(named: name) {
            //计算原始图片的宽高比
            let aspect = image.size.width / image.size.height
            //设置imageView宽高比约束
            aspectConstraint = NSLayoutConstraint(item: imgView,
                                                  attribute: .width, relatedBy: .equal,
                                                  toItem: imgView, attribute: .height,
                                                  multiplier: aspect, constant: 20.0)
            //加载图片
            imgView.image = image
        }else{
            //去除imageView里的图片和宽高比约束
            aspectConstraint = nil
            imgView.image = nil
        }
    }
}

extension RowHeightCell{
    
   
}
