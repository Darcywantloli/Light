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
    
    weak var delegate: CustomEffectDelegate?
    
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
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                firstLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                firstLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 1:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                secondLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                secondLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 2:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                thirdLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                thirdLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 3:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                fourthLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                fourthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 4:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                fifthLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                fifthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 5:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                sixthLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                sixthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 6:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                seventhLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                seventhLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 7:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                eighthLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                eighthLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        case 8:
            lights[sender.tag] = !lights[sender.tag]
            if lights[sender.tag] {
                ninethLightButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
            } else {
                ninethLightButton.setImage(UIImage(systemName: "lightbulb"), for: .normal)
            }
        default:
            break
        }
    }
    
    @IBAction func saveEffectComponents(_ sender: Any) {
        delegate?.getLightAndTime(lights: lights, time: time)
        
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension CustomEffectViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return String(Float(row + 1) / 10)
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        time = "\(Float(row + 1) / 10)"
    }
}

// MARK: - CustomEffectDelegate

protocol CustomEffectDelegate: NSObjectProtocol {
    
    func getLightAndTime(lights: [Bool], time: String)
}
