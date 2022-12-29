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
        titleArray = ["上下抽屉效果，带模块缩小变换","非全屏一页一页滚动(慢)","非全屏一页一页滚动(快)","文本折叠收起","商品评论结构"]
        vcArray = [SisypheHomeAnimationVC(),NoFullPageScrollVC(),NOFullPageScrollFastVC(),LabelFoldVC(),StoreCommentVC()]
        view.addSubview(tableView)
        tableView.reloadData()
        
        
//        var text = "哈哈哈\n\n哈哈哈\n\n\n哈哈\n哈哈\n \n \n \nqqq"
//
//        let regExpStr = "^[\\n]{2,}$"
//        let replacement = "\n";
//
//        do {
//            let RE = try NSRegularExpression(pattern: regExpStr, options: .caseInsensitive)
//            text = RE.stringByReplacingMatches(in: text, options: .reportProgress, range: NSRange(location: 0, length: text.count), withTemplate: replacement)
//        } catch {
//
//        }
        // 正则表达式使用
        let test = "哈哈哈\n\n哈\r\r\r哈\r哈\n\n\n哈\r哈\n哈哈\n \n \n \nqqq"
        let regex = "\r+"
        do {
            let RE = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            let modified = RE.stringByReplacingMatches(in: test, options: .reportProgress, range: NSRange(location: 0, length: test.count), withTemplate: "\n")
            print(modified)
        } catch {

        }
        
        
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
