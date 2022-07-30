//
//  NoFullPageScrollVC.swift
//  DevelopeLibrary
//
//  Created by Somer.King on 2022/7/29.
//

import UIKit

//private let kPageWidth: CGFloat = 327
//private let kPagePading: CGFloat = 10
class NoFullPageScrollVC: UIViewController {
    let colorArr: [UIColor] = [.blue, .red, .yellow, .black, .brown, .green, .gray, .purple, .red, .yellow]

    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let y = QSafeHeightTop() + 44

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: kPageWidth, height: kScreenH - y)
        layout.minimumLineSpacing = kPagePading

        let coView = UICollectionView(frame: CGRect(x: 0, y: y, width: kScreenW, height: kScreenH - y), collectionViewLayout: layout)
        coView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell")
        coView.delegate = self
        coView.dataSource = self
        coView.decelerationRate = .init(rawValue: 1.0)
        view.addSubview(coView)
        self.collectionView = coView
    }
    
    var preOffsetX: CGFloat = 0
    var currentPage: Int = 0
    var onePageWidth: CGFloat = kPageWidth + kPagePading
    var isDraging = false
    var isScrolling = false {
        didSet {
            if !isScrolling { // 停止滚动计算当前page
                let off = self.collectionView?.contentOffset.x ?? 0
                currentPage = Int((off+0.5*onePageWidth) / onePageWidth)
            }
        }
    }
}

extension NoFullPageScrollVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isScrolling = true
        
        let offsetX = scrollView.contentOffset.x
        let subOffsetX = offsetX - preOffsetX
        
        if isDraging { // 正在拽动
            preOffsetX = offsetX
            return
        }
        
        let off = self.collectionView?.contentOffset.x ?? 0
        NSLog("滚动偏移：%.2f   subOffsetX: %.2f  currentPage:%d", off, subOffsetX, currentPage)
        
        if subOffsetX > 0 { // 向右移动
            let maxOffset = CGFloat(currentPage + 1) * onePageWidth
            if offsetX >= maxOffset { // 滑动到刚好一格
                if maxOffset >= onePageWidth * CGFloat(colorArr.count - 1) {
                    
                } else {
                    scrollView.setContentOffset(CGPoint(x: maxOffset, y: 0), animated: false)
                    isScrolling = false
                }
            }
        } else if subOffsetX < 0 { // 向左移动
            let minOffset = CGFloat(currentPage - 1) * onePageWidth
            if offsetX <= minOffset { // 滑动到刚好一格
                if minOffset <= 0 {

                } else {
                    scrollView.setContentOffset(CGPoint(x: minOffset, y: 0), animated: false)
                    isScrolling = false
                }
            }
        }
        preOffsetX = offsetX
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDraging = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isDraging = false
        if !decelerate {
            isScrolling = false
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isScrolling = false
    }
}

extension NoFullPageScrollVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = colorArr[indexPath.row]
        return cell
    }
}
