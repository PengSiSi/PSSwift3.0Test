//
//  MyCollectionViewVCCollectionViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyCollectionViewVCCollectionViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    // 间距
    let cellSpace = 1 / UIScreen.main.scale
    
    // 列数
    let columnsNum = 7
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
//        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.view.addSubview(collectionView!)
        self.collectionView?.backgroundColor = UIColor.white
        
        //水平间隔
        layout.minimumInteritemSpacing = cellSpace
        //垂直行间距
        layout.minimumLineSpacing = cellSpace
        
        //整个view的宽度
        let collectionViewWidth = self.collectionView!.bounds.width
        //整个view横向除去间距后，剩余的像素个数
        let pxWidth = collectionViewWidth * UIScreen.main.scale - CGFloat(columnsNum - 1)
        
        //单元格宽度（像素）
        let itemWidthPx = CGFloat(Int(pxWidth / CGFloat(columnsNum)))
        //单元格宽度（点）
        let itemWidth = itemWidthPx / UIScreen.main.scale
        
        //设置单元格宽度和高度
        layout.itemSize = CGSize(width:itemWidth, height:itemWidth)
        
        //剩余像素（作为左右内边距）
        let remainderPx = pxWidth - itemWidthPx * CGFloat(columnsNum)
        
        //左内边距
        let paddingLeftPx = CGFloat(Int(remainderPx/2))
        let paddingLeft = paddingLeftPx / UIScreen.main.scale
        
        //右内边距
        let paddingRightPx = remainderPx - paddingLeftPx
        //右内边距做-0.001特殊处理，否则在plus设备下可能摆不下
        let paddingRight = paddingRightPx / UIScreen.main.scale - 0.001
        
        //设置内边距
        layout.sectionInset = UIEdgeInsets(top: 0, left: paddingLeft,
                                           bottom: 0, right: paddingRight)
        
        self.collectionView?.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = "\(indexPath.row)"
        cell.backgroundColor = UIColor.green
        cell.titleLabel.textColor = UIColor.black
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
