//
//  SisypheHomeAnimationVC.swift
//  sisypheHomeArc
//
//  Created by Link on 2022/7/29.
//

import UIKit

class SisypheHomeAnimationVC: UIViewController {
    
    lazy var topScrollView = UIScrollView()
    lazy var tableView = UITableView()
    
    lazy var calendarView = UIView.init(frame: CGRect(x: 16, y: kScreenH-206-26-100, width: kScreenW-32, height: 206))
    var isOpen = true
    
    var button = UIButton.init(frame: CGRect(x: 280, y: 40, width: 40, height: 40))
    
    var offsetx:CGFloat = 0
    var offsety:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topScrollView.frame = CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-88-100)
        view.addSubview(topScrollView)
        topScrollView.backgroundColor = .green
        topScrollView.alwaysBounceVertical = true
//        topScrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-88+40)
        topScrollView.delegate = self
        topScrollView.contentInsetAdjustmentBehavior = .never
        
        calendarView.backgroundColor = .red
        calendarView.isUserInteractionEnabled = false
        view.addSubview(calendarView)
        
        let cadButton = UIButton.init(frame: view.convert(calendarView.frame, to: topScrollView))
        cadButton.backgroundColor = .yellow
        topScrollView.addSubview(cadButton)
        cadButton.addTarget(self, action: #selector(tapCalendar), for: .touchUpInside)
        
        calendarView.layer.masksToBounds = false
        calendarView.layer.shadowColor = UIColor.black.cgColor
        calendarView.layer.shadowOffset = CGSize(width: 0, height: 4)
        calendarView.layer.shadowRadius = 10
        calendarView.layer.shadowOpacity = 1
        calendarView.layer.cornerRadius = 8
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: topScrollView.bounds.height+88, width: UIScreen.main.bounds.size.width, height: topScrollView.bounds.height)
        
        button.backgroundColor = .red
        button.alpha = 0
        button.isHidden = true
        view.addSubview(button)
        button.addTarget(self, action: #selector(openTop), for: .touchUpInside)
        
        offsetx = self.button.center.x-self.calendarView.center.x
        offsety = self.button.center.y-self.calendarView.center.y
    }
    
    @objc func tapCalendar(){
        NSLog("点击日历")
    }

    @objc func openTop(){
        isOpen = true
        UIView.animate(withDuration: 0.25) {
            self.tableView.frame = CGRect(x: 0, y: self.topScrollView.bounds.height+88, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height)
//            self.calendarView.frame = CGRect(x: 16, y: kScreenH-206-26, width: kScreenW-32, height: 206)
            self.calendarView.transform = CGAffineTransform.identity
            self.calendarView.alpha = 1.0
            self.button.alpha = 0
        }completion: { flag in
            if flag {
                self.button.isHidden = true
            }
        }
    }
}

extension SisypheHomeAnimationVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SisypheHomeAnimationVC: UIScrollViewDelegate, UIGestureRecognizerDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            return
        }
        NSLog("scrollViewOffset:%f",scrollView.contentOffset.y)
        let offset = scrollView.contentOffset.y
        
        if offset >= 80 && isOpen {
            isOpen = false
            UIView.animate(withDuration: 0.25) {
                self.tableView.frame = CGRect(x: 0, y: 88, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height)
                self.calendarView.transform = CGAffineTransform(translationX: self.offsetx, y: self.offsety).scaledBy(x: 0.2, y: 0.2)
                self.button.isHidden = false
                self.button.alpha = 1.0
            }
        }
        
       
        if isOpen {
            let ratio = (offset/scrollView.frame.size.height)
//            NSLog("scrollViewOffset:%f",ratio)
            tableView.frame = CGRect(x: 0, y: topScrollView.bounds.height+88-offset, width: tableView.frame.size.width, height: tableView.frame.size.height)
            
            var scale = (1-ratio)
            if scale >= 1 {
                scale = 1
            }
            
            var offsetx = offsetx*ratio
            if offsetx < 0 {
                offsetx = 0
            }
            calendarView.transform = CGAffineTransform(translationX: offsetx, y: offsety*ratio).scaledBy(x: scale, y: scale)
        }
    }
    
}

