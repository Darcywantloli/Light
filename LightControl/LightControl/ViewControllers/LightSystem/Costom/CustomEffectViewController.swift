//
//  CostomEffectViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/17.
//

import UIKit

class CustomEffectViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstLightButton: UIButton!
    @IBOutlet weak var secondLightButton: UIButton!
    @IBOutlet weak var thirdLightButton: UIButton!
    @IBOutlet weak var fourthLightButton: UIButton!
    @IBOutlet weak var fifthLightButton: UIButton!
    @IBOutlet weak var sixthLightButton: UIButton!
    @IBOutlet weak var seventhLightButton: UIButton!
    @IBOutlet weak var eighthLightButton: UIButton!
    @IBOutlet weak var ninethLightButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var timePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.title = "新增特效"
        
        setupLabel()
        setupButton()
        setupPickerView()
    }
    
    private func setupLabel() {
        titleLabel.text = "設定特效"
    }
    
    private func setupButton() {
        firstLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        secondLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        thirdLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        fourthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        fifthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        sixthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        seventhLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        eighthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        ninethLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        
        addButton.backgroundColor = .systemBlue
        addButton.setTitle("儲存", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.layer.cornerRadius = addButton.frame.height / 6
    }
    
    private func setupPickerView() {
        timePickerView.delegate = self
        timePickerView.dataSource = self
    }
    
    @IBAction func saveEffectComponents(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CustomEffectViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(Float(row + 1) / 10) + "s"
    }
}
