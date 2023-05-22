//
//  DefaultEffectTableViewCell.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/18.
//

import UIKit

class DefaultEffectTableViewCell: UITableViewCell {
    
    static let identifier = "DefaultEffectTableViewCell"

    @IBOutlet weak var effectNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
