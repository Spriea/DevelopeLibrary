//
//  StoreCommentVC.swift
//  DevelopeLibrary
//
//  Created by Link on 2022/12/8.
//

import UIKit

class StoreCommentVC: UIViewController {
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor.white
        view.contentInsetAdjustmentBehavior = .never
        view.sectionFooterHeight = 0
        view.sectionHeaderHeight = 0
        view.estimatedSectionHeaderHeight = 0
        view.estimatedSectionFooterHeight = 0
        if #available(iOS 15.0, *) {
            view.sectionHeaderTopPadding = 0
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StoreCommentVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 375, height: 40))
        view.backgroundColor = .red
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .gray
        return cell
    }
}
