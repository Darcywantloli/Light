//
//  MainViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/10.
//

import UIKit
import CoreBluetooth

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var lightButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var developeButton: UIButton!
    
    let bluetoothService = BluetoothServices.shared
    
    var peripheral: CBPeripheral? = BluetoothServices.shared.connectedPeripheral
    var characteristic: CBCharacteristic? = BluetoothServices.shared.rxtxCharacteristic
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bluetoothService.delegate = self
        
        setupUI()
    }

    func setupUI() {
        setupLabel()
        setupButton()
        setupNavigationBar()
        setupRightBarButtonItem()
    }

    private func setupLabel() {
        titleLabel.text = "歡迎使用"
        subTitleLabel.text = "在這裡你可以自由設定燈光效果及留言板的內容。"
    }
    
    private func setupButton() {
        lightButton.backgroundColor = .systemBlue
        lightButton.setTitle("燈光特效", for: .normal)
        lightButton.setTitleColor(.white, for: .normal)
        lightButton.layer.cornerRadius = lightButton.frame.height / 6
        
        messageButton.backgroundColor = .systemBlue
        messageButton.setTitle("文字傳送", for: .normal)
        messageButton.setTitleColor(.white, for: .normal)
        messageButton.layer.cornerRadius = messageButton.frame.height / 6
        
        developeButton.backgroundColor = .systemBlue
        developeButton.setTitle("更多功能", for: .normal)
        developeButton.setTitleColor(.white, for: .normal)
        developeButton.layer.cornerRadius = developeButton.frame.height / 6
    }
    
    private func setupNavigationBar() {
        self.navigationItem.hidesBackButton = true
    }
    
    private func setupRightBarButtonItem() {
        let researchButton = UIBarButtonItem(title: "重新搜尋", style: .plain, target: self, action: #selector(reseachPeripheral))
        
        navigationItem.rightBarButtonItem = researchButton
    }
    
    @IBAction func lightSystem(_ sender: Any) {
        let nextVC = LightSystemViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func messageSystem(_ sender: Any) {
        let nextVC = MessageSystemViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func develope(_ sender: Any) {
        Alert.showAlert(title: "通知",
                        message: "後續更多功能正在開發中",
                        vc: self,
                        confirmTitle: "確認")
    }
    //    @IBAction func writeValueToPeripheral(_ sender: Any) {
//        print(peripheral!)
//        print(characteristic!)
//
//        var data: Data? = "N".data(using: .utf8)
//
//        bluetoothService.writeValue(peripheral: peripheral!,
//                                    characteristic: characteristic!,
//                                    type: .withoutResponse,
//                                    data: data!)
//    }
    
    @objc func reseachPeripheral() {
        let nextVC = SelectPeripheralController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension MainViewController: BluetoothServicesDelegate {
    
    func getBLEPeripherals(peripherals: [CBPeripheral]) {
    }
    
//    func getPeripheralAndCharacteristic(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
//        self.peripheral = peripheral
//        self.characteristic = characteristic
//    }
}
