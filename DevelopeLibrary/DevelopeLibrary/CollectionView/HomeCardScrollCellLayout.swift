//
//  HomeCardScrollCellLayout.swift
//  DevelopeLibrary
//
//  Created by Somer.King on 2022/7/30.
//

import UIKit

private let kItemWidth:CGFloat = 70     // item宽高
private let kPaddingMid:CGFloat = 30    // item间距
private let kPaddingLeft:CGFloat = 20   // 最左边item左边距
class HomeCardScrollCellLayout: UICollectionViewFlowLayout {
    var pageCapacity = 0    // 每页可以完整展示的item个数 =
    var currentIndex = 0    // 当前页码（滑动前）
    
    override func prepare(){
        super.prepare()
        var paddingRight = 0
        guard let collectionView = self.collectionView else {
            return
        }
        var itemsCount = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: 0)
        
        // item间距
        self.minimumInteritemSpacing = kPaddingMid
        self.minimumLineSpacing = kPaddingMid
        self.itemSize = CGSize(width: kItemWidth, height: kItemWidth)
        
        let collectionWidth = collectionView.bounds.size.width
        
        
    }
}

extension HomeCardScrollCellLayout: UIScrollViewDelegate, UICollectionViewDelegate {
    
}
