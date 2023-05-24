//
//  EffectListViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/18.
//

import UIKit
import RealmSwift

class EffectListViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var componentsTableView: UITableView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Variables
    
    var effectLights: [String] = []
    var effectTime: [String] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        self.title = "新增組合"
        
        setupButton()
        setupTableView()
        setupRightBarButtonItems()
    }
    
    private func setupButton() {
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("儲存", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = saveButton.frame.height / 6
    }
    
    private func setupTableView() {
        componentsTableView.delegate = self
        componentsTableView.dataSource = self
        componentsTableView.register(UINib(nibName: "EffectComponentTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: EffectComponentTableViewCell.identifier)
    }
    
    private func setupRightBarButtonItems() {
        let addButton = UIBarButtonItem(title: "新增特效",
                                        style: .plain,
                                        target: self,
                                        action: #selector(addEffectComponents))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addEffectComponents() {
        let nextVC = CustomEffectViewController()
        nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func saveCustomEffect(_ sender: Any) {
        Alert.showAlertWithTextField(title: "通知",
                                     message: "請輸入特效組合的名稱",
                                     vc: self,
                                     confirmTitle: "確認",
                                     cancelTitle: "取消") { textField in
            if let name = textField.text, !name.isEmpty {
                let lightCode = Effect.effectCodeEncoder(lightCode: self.effectLights,
                                                         time: self.effectTime)
                let effectModel = Light(name: name, lightCode: lightCode, isCustom: true)

                LocalDatabase.shared.add(model: effectModel) { result in
                    switch result {
                    case .success(_):
                        Alert.showAlert(title: "通知",
                                        message: "新增特效組合成功",
                                        vc: self,
                                        confirmTitle: "確認") {
                            self.navigationController?.popViewController(animated: true)
                        }
                    case .failure(let error):
                        print("新增特效組合失敗，Error：\(error.localizedDescription)")
                        Alert.showAlert(title: "錯誤",
                                        message: "新增特效組合失敗",
                                        vc: self,
                                        confirmTitle: "確認")
                    }
                }
            } else {
                Alert.showAlert(title: "錯誤",
                                message: "特效組合名稱不得為空",
                                vc: self,
                                confirmTitle: "確認")
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension EffectListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if effectLights.count == effectTime.count {
            return effectLights.count
        } else {
            Alert.showAlert(title: "錯誤",
                            message: "特效丟失",
                            vc: self,
                            confirmTitle: "確認")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EffectComponentTableViewCell.identifier,
                                                 for: indexPath) as! EffectComponentTableViewCell
        let lightString = Array(effectLights[indexPath.row])
        
        for light in lightString {
            switch light {
            case "1":
                cell.firstLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "2":
                cell.secondLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "3":
                cell.thirdLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "4":
                cell.fourthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "5":
                cell.fifthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "6":
                cell.sixthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "7":
                cell.seventhLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "8":
                cell.eighthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            case "9":
                cell.ninethLightImageView.image = UIImage(systemName: "lightbulb.fill")
            default:
                break
            }
        }
        
        cell.timeLabel.text = effectTime[indexPath.row] + "s"
        
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - CustomEffectDelegate

extension EffectListViewController: CustomEffectDelegate {
    
    func getLightAndTime(lights: [Bool], time: String) {
        effectLights.append(Effect.effectBoolToString(bools: lights))
        effectTime.append(time)
        
        DispatchQueue.main.async {
            self.componentsTableView.reloadData()
        }
    }
}
