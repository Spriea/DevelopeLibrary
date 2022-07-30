//
//  PageLayout.swift
//  DevelopeLibrary
//
//  Created by Somer.King on 2022/7/30.
//

import UIKit

private let kScrollPageRatio:CGFloat = 0.5 // 翻页滚动距离比例
class PageLayout: UICollectionViewFlowLayout {
    
    private var lastOffset: CGPoint!
    
    override init() {
        super.init()
        lastOffset = CGPoint.zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        self.collectionView?.decelerationRate = .fast
    }
    
    // 这个方法的返回值，决定了 CollectionView 停止滚动时的偏移量
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        // 分页的 width
        let pageSpace = self.stepSpace()
        guard let collectionView = self.collectionView else {
            return proposedContentOffset
        }
        let letfInset = collectionView.contentInset.left
        let offsetMax: CGFloat = collectionView.contentSize.width - (collectionView.bounds.width + letfInset)
        let offsetMin: CGFloat = -letfInset
        
        if proposedContentOffset.x < offsetMin || proposedContentOffset.x > offsetMax {
            lastOffset.x = proposedContentOffset.x
            return proposedContentOffset
        }
        
        let subOffset = proposedContentOffset.x - lastOffset.x
        // 位移距离
        let offsetForCurrentPointX: CGFloat = abs(subOffset)
        let velocityX = velocity.x
        
        //向左 true, 向右 fasle
        let direction: Bool = subOffset > 0
        NSLog("滚动速度：%f 偏移:%f ", velocityX,offsetForCurrentPointX)
        var cOffsetX:CGFloat = 0
        if velocityX > 0.3 || velocityX < -0.3{
            cOffsetX = lastOffset.x + (direction ? pageSpace : -pageSpace)
        }else{
            if offsetForCurrentPointX > pageSpace*0.4 {
                cOffsetX = lastOffset.x + (direction ? pageSpace : -pageSpace)
            }else{
                cOffsetX = lastOffset.x
            }
        }
        let pageOffsetX = CGFloat(Int((cOffsetX+0.5*pageSpace)/pageSpace))*pageSpace-letfInset
        
        lastOffset.x = pageOffsetX
        return CGPoint(x: pageOffsetX, y: proposedContentOffset.y)
    }
    
    // 每滑动一页的间距
    public func stepSpace() -> CGFloat {
        return self.itemSize.width + self.minimumLineSpacing
    }
}

