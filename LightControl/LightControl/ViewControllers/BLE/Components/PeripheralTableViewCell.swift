//
//  PeripheralTableViewCell.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/3.
//

import UIKit

class PeripheralTableViewCell: UITableViewCell {

    @IBOutlet weak var peripheralNameLabel: UILabel!
    
    static let identifier = "PeripheralTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
