//
//  Common.swift
//  DevelopeLibrary
//
//  Created by Somer.King on 2022/7/29.
//

import UIKit

let kScreenH =  UIScreen.main.bounds.size.height
let kScreenW = UIScreen.main.bounds.size.width

func QKeyWindow() -> UIWindow? {
    return UIApplication.shared.windows.first
}

/// safeArea // 获取留海或者底部safeArea高度
func QSafeHeightTop() -> CGFloat {
    let safeHeightTop = QKeyWindow()?.safeAreaInsets.top
    if safeHeightTop != 0 {
        return safeHeightTop ?? 0
    }else{
        return 0
    }
}
func QSafeHeightBottom() -> CGFloat {
    let safeHeightBottom = QKeyWindow()?.safeAreaInsets.bottom
    return safeHeightBottom ?? 0
}
