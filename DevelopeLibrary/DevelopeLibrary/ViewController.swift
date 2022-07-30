//
//  ViewController.swift
//  DevelopeLibrary
//
//  Created by Somer.King on 2022/7/29.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView {
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }
    
    var titleArray = [String]()
    var vcArray = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleArray = ["上下抽屉效果，带模块缩小变换","非全屏一页一页滚动(慢)","非全屏一页一页滚动(快)"]
        vcArray = [SisypheHomeAnimationVC(),NoFullPageScrollVC(),NOFullPageScrollFastVC()]
        view.addSubview(tableView)
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = .systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(vcArray[indexPath.row] as! UIViewController, animated: true)
    }
}
