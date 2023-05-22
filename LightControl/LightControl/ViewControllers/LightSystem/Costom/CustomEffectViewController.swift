//
//  CostomEffectViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/17.
//

import UIKit

class CustomEffectViewController: UIViewController {

    // MARK: - IBOutlet
    
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
    
    // MARK: - Variables
    
    var lights: [Bool] = [false, false, false, false, false, false, false, false, false]
    var time: String = ""
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
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
    
    // MARK: - Function
    
    // MARK: - IBAction
    
    @IBAction func lightOnOff(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if lights[sender.tag] {
                firstLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                firstLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            }
            lights[sender.tag] = !lights[sender.tag]
        case 1:
            lights[sender.tag] = !lights[sender.tag]
        case 2:
            lights[sender.tag] = !lights[sender.tag]
        case 3:
            lights[sender.tag] = !lights[sender.tag]
        case 4:
            lights[sender.tag] = !lights[sender.tag]
        case 5:
            lights[sender.tag] = !lights[sender.tag]
        case 6:
            lights[sender.tag] = !lights[sender.tag]
        case 7:
            lights[sender.tag] = !lights[sender.tag]
        case 8:
            lights[sender.tag] = !lights[sender.tag]
        default:
            break
        }
    }
    
    @IBAction func saveEffectComponents(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension CustomEffectViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 100
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(Float(row + 1) / 10)
        case 1:
            return "sec"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        time = row.description
    }
}

// MARK: - CustomEffectDelegate

protocol CustomEffectDelegate: NSObject {
    
}
