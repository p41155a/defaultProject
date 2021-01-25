//
//  TableSampleTableViewCell.swift
//  defaultProject
//
//  Created by Yoojin Park on 2021/01/25.
//

import UIKit

class TableSampleTableViewCell: UITableViewCell {
    @IBOutlet private weak var sampleTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(title: String) {
        sampleTitleLabel.text = title
    }
}
