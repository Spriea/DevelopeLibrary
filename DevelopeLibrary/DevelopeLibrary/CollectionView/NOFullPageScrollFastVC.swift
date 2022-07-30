//
//  NOFullPageScrollFastVC.swift
//  DevelopeLibrary
//
//  Created by Somer.King on 2022/7/30.
//

import UIKit

let kPageWidth: CGFloat = 327
let kPagePading: CGFloat = 10
class NOFullPageScrollFastVC: UIViewController {
    let colorArr: [UIColor] = [.blue, .red, .yellow, .black, .brown, .green, .gray, .purple, .red, .yellow]

    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let y = QSafeHeightTop() + 44

        let layout = PageLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: kPageWidth, height: kPageWidth)
        layout.minimumLineSpacing = 10

        let coView = UICollectionView(frame: CGRect(x: 0, y: y, width: kScreenW, height: kScreenH - y), collectionViewLayout: layout)
        coView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell")
        coView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        coView.delegate = self
        coView.dataSource = self
        coView.isPagingEnabled = false
        view.addSubview(coView)
        self.collectionView = coView
    }
    
    var preOffsetX: CGFloat = 0
    var lastEndOffsetX: CGFloat = 0
    var currentPage: Int = 0
    var onePageWidth: CGFloat = kPageWidth + kPagePading
    var isDraging = false
    var isIncrease = true // 偏移量是否递增
}

extension NOFullPageScrollFastVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        NSLog("offsetX:%f", scrollView.contentOffset.x)
    }
}
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetX = scrollView.contentOffset.x
//        let subOffsetX = offsetX - preOffsetX
//        self.isIncrease = subOffsetX > 0
//        preOffsetX = offsetX
//
////        if !isDraging {
////            UIView.animate(withDuration: 0.25) {
////                scrollView.contentOffset = CGPoint(x: self.lastEndOffsetX, y: scrollView.contentOffset.y)
////            }
////        }
////        return
////        let subOffsetX = offsetX - preOffsetX
////
////        let off = self.collectionView?.contentOffset.x ?? 0
////        NSLog("滚动偏移：%.2f   subOffsetX: %.2f  currentPage:%d", off, subOffsetX, currentPage)
////
////        if isDraging { // 正在拽动
////            preOffsetX = offsetX
////            return
////        }else{  // 拽动停止，自动滚动
////            if subOffsetX > 0 { // 向左移动
////                if isAnimation {
////                    return
////                }
////                let maxOffset = CGFloat(currentPage + 1) * onePageWidth
////                if maxOffset >= onePageWidth * CGFloat(colorArr.count - 1) {
////
////                } else {
////                    isAnimation = true
////                    UIView.animate(withDuration: 0.25) {
////                        scrollView.setContentOffset(CGPoint(x: maxOffset, y: 0), animated: false)
////                        self.currentPage = Int((scrollView.contentOffset.x+0.5*kPageWidth) / kPageWidth)
////                    } completion: { flag in
////                        self.isAnimation = false
////                    }
////                }
//////                if offsetX >= maxOffset { // 滑动到刚好一格
//////
//////                }
////            } else if subOffsetX < 0 { // 向右移动
////                let minOffset = CGFloat(currentPage - 1) * onePageWidth
////                if offsetX <= minOffset { // 滑动到刚好一格
////                    if minOffset <= 0 {
////
////                    } else {
////                        scrollView.setContentOffset(CGPoint(x: minOffset, y: 0), animated: true)
////                        currentPage = Int((scrollView.contentOffset.x+0.5*kPageWidth) / kPageWidth)
////                    }
////                }
////            }
////            preOffsetX = offsetX
////        }
//    }
//
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        isDraging = true
//    }
//
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        isDraging = false
//        if !decelerate {
//            currentPage = Int((scrollView.contentOffset.x+0.5*kPageWidth) / kPageWidth)
//            scrollView.setContentOffset(CGPoint(x: kPageWidth*CGFloat(currentPage), y: scrollView.contentOffset.y), animated: true)
//        }else{
//            if isIncrease { // 向左移动
//                let maxOffset = CGFloat(currentPage + 1) * onePageWidth
//                if maxOffset >= onePageWidth * CGFloat(colorArr.count - 1) {
//
//                } else {
//                    lastEndOffsetX = maxOffset
////                    scrollView.setContentOffset(CGPoint(x: maxOffset, y: 0), animated: true)
//                    currentPage = currentPage + 1
//                }
//            } else  { // 向右移动
//                let minOffset = CGFloat(currentPage - 1) * onePageWidth
//                if minOffset <= 0 {
//
//                } else {
//                    lastEndOffsetX = minOffset
////                    scrollView.setContentOffset(CGPoint(x: minOffset, y: 0), animated: true)
//                    currentPage = currentPage - 1
//                }
//            }
//        }
//    }
//}

extension NOFullPageScrollFastVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = colorArr[indexPath.row]
        return cell
    }
}
