//
//  LightSystemViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/16.
//

import UIKit

class LightSystemViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var defaultEffectButton: UIButton!
    @IBOutlet weak var customEffectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        self.title = "燈光特效"
        
        setupLabel()
        setupButton()
    }
    
    private func setupLabel() {
        titleLabel.text = "歡迎使用"
    }
    
    private func setupButton() {
        defaultEffectButton.backgroundColor = .systemBlue
        defaultEffectButton.setTitle("內建特效", for: .normal)
        defaultEffectButton.setTitleColor(.white, for: .normal)
        defaultEffectButton.layer.cornerRadius = defaultEffectButton.frame.height / 6
        
        customEffectButton.backgroundColor = .systemBlue
        customEffectButton.setTitle("自定義特效", for: .normal)
        customEffectButton.setTitleColor(.white, for: .normal)
        customEffectButton.layer.cornerRadius = customEffectButton.frame.height / 6
    }
    
    @IBAction func defaultEffect(_ sender: Any) {
        let nextVC = DefaultEffectViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func costomEffect(_ sender: Any) {
        let nextVC = CustomListViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
