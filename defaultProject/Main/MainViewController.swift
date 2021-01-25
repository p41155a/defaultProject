//
//  MainViewController.swift
//  defaultProject
//
//  Created by Yoojin Park on 2021/01/25.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func moveTableSampleView(_ sender: UIButton) {
        let viewcontroller = TableSampleViewController.instantiate()
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
