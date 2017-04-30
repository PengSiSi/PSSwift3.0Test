//
//  CycleView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/25.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

private let CellID = "CellID"

class CycleView: UIView {

    var cycleTimer: Timer? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var dataArray: [String]? {
        didSet {
            // 接收数据,刷新表视图
            collectionView.reloadData()
        }
    }
    
    // xib配置
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = UIViewAutoresizing()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CycleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellID)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        //注意去掉xib 中Menu View 中的autosizing四条线（< 、^、 右、下、）否则下面打印的为 (0.0, 0.0, 414.0, 33.0)
        //如果不使用上面的方法，也可以使用autoresizingMask = UIViewAutoresizing() , 这条语句写在override func awakeFromNib() {中
        //        print(collectionView.bounds);//(0.0, 0.0, 414.0, 181.0) 实际大小
    }
}

extension CycleView {
    
    class func CycleView() -> CycleView {
        
        return Bundle.main.loadNibNamed("CycleView", owner: nil, options: nil)?.first as! CycleView
    }
}

extension CycleView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (dataArray?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! CycleCollectionViewCell
        return cell
    }
}

extension CycleView {
    
    private func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    private func removeCycleTimer() {
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    
    @objc private func scrollToNext() {
        // 滚动collectionView
        let currentOffSet = collectionView.contentOffset.x + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: currentOffSet, y: 0), animated: true)
    }
}

extension CycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        pageControl.currentPage = Int(offset / scrollView.bounds.width) % (dataArray?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        addCycleTimer()
    }
}

