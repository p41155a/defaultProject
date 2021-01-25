//
//  TableSampleViewController.swift
//  defaultProject
//
//  Created by Yoojin Park on 2021/01/25.
//

import UIKit

class TableSampleViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    let cellData = ["안녕하세요", "나중에 활용하기 좋게 만들었어요", "tableViewSample"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableSampleTableViewCell.register(tableView: tableView)
    }
}

extension TableSampleViewController: UITableViewDelegate {
}

extension TableSampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableSampleTableViewCell.dequeueReusableCell(tableView: tableView)
        cell.setData(title: cellData[indexPath.row])
        
        return cell
    }
}
