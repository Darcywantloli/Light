//
//  EffectComponentTableViewCell.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/18.
//

import UIKit

class EffectComponentTableViewCell: UITableViewCell {
    
    static let identifier = "EffectComponentTableViewCell"
    
    @IBOutlet weak var firstLightImageView: UIImageView!
    @IBOutlet weak var secondLightImageView: UIImageView!
    @IBOutlet weak var thirdLightImageView: UIImageView!
    @IBOutlet weak var fourthLightImageView: UIImageView!
    @IBOutlet weak var fifthLightImageView: UIImageView!
    @IBOutlet weak var sixthLightImageView: UIImageView!
    @IBOutlet weak var seventhLightImageView: UIImageView!
    @IBOutlet weak var eighthLightImageView: UIImageView!
    @IBOutlet weak var ninethLightImageView: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupImageView() {
        firstLightImageView.image = UIImage(systemName: "lightbulb")
        secondLightImageView.image = UIImage(systemName: "lightbulb")
        thirdLightImageView.image = UIImage(systemName: "lightbulb")
        fourthLightImageView.image = UIImage(systemName: "lightbulb")
        fifthLightImageView.image = UIImage(systemName: "lightbulb")
        sixthLightImageView.image = UIImage(systemName: "lightbulb")
        seventhLightImageView.image = UIImage(systemName: "lightbulb")
        eighthLightImageView.image = UIImage(systemName: "lightbulb")
        ninethLightImageView.image = UIImage(systemName: "lightbulb")
    }
}
