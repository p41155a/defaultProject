//
//  TableViewCelled.swift
//  defaultProject
//
//  Created by Yoojin Park on 2021/01/25.
//

import UIKit

protocol TableViewCelled {
    static func register(tableView: UITableView)
    static func dequeueReusableCell(tableView: UITableView) -> Self
}

extension TableViewCelled where Self: UITableViewCell {
    static func register(tableView: UITableView) {
        let Nib = UINib(nibName: self.NibName, bundle: nil)
        tableView.register(Nib, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    static func dequeueReusableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) else {
            fatalError("Error! \(self.reuseIdentifier)")
        }
        
        return cell as! Self
    }
    
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    static var NibName: String {
        String(describing: self)
    }
}
