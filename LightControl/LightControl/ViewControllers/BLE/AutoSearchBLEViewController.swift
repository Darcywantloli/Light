//
//  AutoSearchBLEViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/8.
//

import UIKit
import CoreBluetooth

class AutoSearchBLEViewController: UIViewController {

    var spinner = UIActivityIndicatorView(style: .large)
    
    let bluetoothService = BluetoothServices.shared
    
    private var peripherals: [CBPeripheral] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bluetoothService.delegate = self
        
        setupUI()
        autoSearchPeripheral()
    }
    
    func setupUI() {
        setupActivityIndicatorView()
    }
    
    private func setupActivityIndicatorView() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func autoSearchPeripheral() {
        var connectPeripheral = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.bluetoothService.stopScan()
            
            for peripheral in self.peripherals {
                if peripheral.name == UserPreference.shared.lastPeripheral {
                    self.bluetoothService.stopScan()
                    self.bluetoothService.connectPeripheral(peripheral: peripheral)
                    connectPeripheral = true
                    
                    Alert.showAlert(title: "通知",
                                    message: "已連接到上次使用的設備",
                                    vc: self,
                                    confirmTitle: "確認") {
                        let nextVC = MainViewController()
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    }
                    
                    break
                }
            }
            
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
            
            if connectPeripheral == false {
                Alert.showAlert(title: "通知",
                                message: "未搜尋到設備，請手動連接",
                                vc: self,
                                confirmTitle: "確認") {
                    let nextVC = SelectPeripheralController()
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
    }
}

extension AutoSearchBLEViewController: BluetoothServicesDelegate {
    
    func getBLEPeripherals(peripherals: [CBPeripheral]) {
        self.peripherals = peripherals
    }
    
//    func getPeripheralAndCharacteristic(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
//    }
}
