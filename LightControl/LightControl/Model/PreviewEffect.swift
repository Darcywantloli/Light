//
//  PreviewEffect.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/23.
//

import Foundation

class PreviewEffect: NSObject {
    
    func timeControl(lightCode: [String],
                     times: [Double],
                     bluetoothService: BluetoothServices) {
        var light = 0
        
        let data = "C".data(using: .utf8)
        
        for time in times {
            lightControl(light: lightCode[light], bluetoothService: bluetoothService)
            Thread.sleep(forTimeInterval: time)
            light += 1
        }

        bluetoothService.writeValue(type: .withoutResponse, data: data!)
    }
    
    private func lightControl(light: String, bluetoothService: BluetoothServices) {
        let lights = Array(light)
        let data = "C".data(using: .utf8)
        
        bluetoothService.writeValue(type: .withoutResponse, data: data!)
        for component in lights {
            Thread.sleep(forTimeInterval: 0.004)
            if component == "1" {
                let data = "1".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "2" {
                let data = "2".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "3" {
                let data = "3".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "4" {
                let data = "4".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "5" {
                let data = "5".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "6" {
                let data = "6".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "7" {
                let data = "7".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "8" {
                let data = "8".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
            if component == "9" {
                let data = "9".data(using: .utf8)
                
                bluetoothService.writeValue(type: .withoutResponse, data: data!)
            }
        }
    }
}
