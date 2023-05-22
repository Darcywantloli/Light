//
//  PreviewEffectViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/20.
//

import UIKit
import CoreBluetooth

class PreviewEffectViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var firstLightImageView: UIImageView!
    @IBOutlet weak var secondLightImageView: UIImageView!
    @IBOutlet weak var thirdLightImageView: UIImageView!
    @IBOutlet weak var fourthLightImageView: UIImageView!
    @IBOutlet weak var fifthLightImageView: UIImageView!
    @IBOutlet weak var sixthLightImageView: UIImageView!
    @IBOutlet weak var seventhLightImageView: UIImageView!
    @IBOutlet weak var eighthLightImageView: UIImageView!
    @IBOutlet weak var ninethLightImageView: UIImageView!
    
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Variables
    
    var loop = false
    
    var previewLightCode: [String] = []
    var previewTime: [Double] = []
    
    var lightType = ""
    var lastLight = ""
    
    let bluetoothService = BluetoothServices.shared
    
    var peripheral: CBPeripheral? = BluetoothServices.shared.connectedPeripheral
    var characteristic: CBCharacteristic? = BluetoothServices.shared.rxtxCharacteristic
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupButton()
    }
    
    private func setupButton() {
        runButton.backgroundColor = .systemBlue
        runButton.setTitle("預覽", for: .normal)
        runButton.setTitleColor(.white, for: .normal)
        runButton.layer.cornerRadius = runButton.frame.height / 6
        
        backButton.backgroundColor = .systemBlue
        backButton.setTitle("返回", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.layer.cornerRadius = backButton.frame.height / 6
    }
    
    // MARK: - Function
    
    func timeControl(lightCode: [String], times: [Double]) {
        var light = 0
        
        let data = "C".data(using: .utf8)
        
        for time in times {
            lightControl(light: lightCode[light])
            Thread.sleep(forTimeInterval: time)
            light += 1
        }

        bluetoothService.writeValue(peripheral: peripheral!,
                                    characteristic: characteristic!,
                                    type: .withoutResponse,
                                    data: data!)
    }
    
    func lightControl(light: String) {
        let lights = Array(light)
        let data = "C".data(using: .utf8)
        
        bluetoothService.writeValue(peripheral: peripheral!,
                                    characteristic: characteristic!,
                                    type: .withoutResponse,
                                    data: data!)
        for component in lights {
            Thread.sleep(forTimeInterval: 0.004)
            if component == "1" {
                let data = "1".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "2" {
                let data = "2".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "3" {
                let data = "3".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "4" {
                let data = "4".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "5" {
                let data = "5".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "6" {
                let data = "6".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "7" {
                let data = "7".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "8" {
                let data = "8".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
            if component == "9" {
                let data = "9".data(using: .utf8)
                
                bluetoothService.writeValue(peripheral: peripheral!,
                                            characteristic: characteristic!,
                                            type: .withoutResponse,
                                            data: data!)
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func runEffect(_ sender: Any) {
        timeControl(lightCode: previewLightCode, times: previewTime)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
