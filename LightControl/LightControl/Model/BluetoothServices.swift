//
//  BluetoothServices.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/3.
//

import CoreBluetooth
import Foundation

class BluetoothServices: NSObject {
    
    static let shared = BluetoothServices()
    
    var central: CBCentralManager!
    var peripheral: CBPeripheralManager!
    
    var connectedPeripheral: CBPeripheral?
    var rxtxCharacteristic: CBCharacteristic?
    
    weak var delegate: BluetoothServicesDelegate?
    
    private var blePeripherals: [CBPeripheral] = []
    
    private override init() {
        super.init()
        let queue = DispatchQueue.global()
        central = CBCentralManager(delegate: self, queue: queue)
    }
    
    /// 搜尋藍芽裝置
    func startScan() {
        central.scanForPeripherals(withServices: nil, options: nil)
    }
    
    /// 停止搜尋
    func stopScan() {
        central.stopScan()
    }
    
    /// 連接藍牙週邊設備
    /// - Parameters:
    ///   - peripheral: 要連接的藍牙周邊設備
    func connectPeripheral(peripheral: CBPeripheral) {
        self.connectedPeripheral = peripheral
        
        central.connect(peripheral, options: nil)
    }
    
    /// 中斷與藍芽週邊設備的連接
    /// - Parameters:
    ///   - peripheral: 要中斷連接的藍牙周邊設備
    func disconnectPeripheral(peripheral: CBPeripheral) {
        central.cancelPeripheralConnection(peripheral)
    }
}

// MARK: - CBCentralManagerDelegate

extension BluetoothServices: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("unknown")
        case .resetting:
            print("resetting")
        case .unsupported:
            print("unsupported")
        case .unauthorized:
            print("unauthorized")
        case .poweredOff:
            print("poweredOff")
        case .poweredOn:
            print("poweredOn")
        @unknown default:
            print("藍芽裝置未知狀態")
        }
        
        startScan()
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        for newPeripheral in blePeripherals {
            if peripheral.name == newPeripheral.name {
                return
            }
        }
        
        if let name = peripheral.name {
            blePeripherals.append(peripheral)
            print(name)
        }
        
        delegate?.getBLEPeripherals(peripherals: blePeripherals)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
    func writeValue(peripheral: CBPeripheral,
                    characteristic: CBCharacteristic,
                    type: CBCharacteristicWriteType,
                    data: Data) {
        peripheral.writeValue(data, for: characteristic, type: type)
    }
}

// MARK: - CBPeripheralDelegate

extension BluetoothServices: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                print(service)
                print(peripheral.name!)
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print(characteristic)
                if characteristic.uuid.isEqual(CBUUID(string: "FFE1")) {
                    peripheral.readValue(for: characteristic)
                    peripheral.setNotifyValue(true, for: characteristic)
                    rxtxCharacteristic = characteristic
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        var characteristicASCIIValue = String()
        guard characteristic == rxtxCharacteristic,
              let characteristicValue = characteristic.value,
              let ASCIIstring = String(data: characteristicValue,
                                       encoding: String.Encoding.utf8) else { return }
        characteristicASCIIValue = ASCIIstring
        print(characteristicASCIIValue)
    }
}

// MARK: - CBPeripheralManagerDelegate

extension BluetoothServices: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .unknown:
            print("unknown")
        case .resetting:
            print("resetting")
        case .unsupported:
            print("unsupported")
        case .unauthorized:
            print("unauthorized")
        case .poweredOff:
            print("poweredOff")
        case .poweredOn:
            print("poweredOn")
        @unknown default:
            print("藍芽裝置未知狀態")
        }
    }
}

// MARK: - Protocol

protocol BluetoothServicesDelegate: NSObjectProtocol {
    
    /// 取得藍牙週邊設備
    /// - Parameters:
    ///   - peripherals: 取得的所有藍牙周邊設備
    func getBLEPeripherals(peripherals: [CBPeripheral])
    
    /// 取得藍芽設備及特徵
    /// - Parameters:
    ///   - peripheral: 取得的藍芽
    ///   - characteristic: 取得的藍芽的特徵
//    func getPeripheralAndCharacteristic(peripheral: CBPeripheral, characteristic: CBCharacteristic)
}
