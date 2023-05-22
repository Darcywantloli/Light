//
//  SelectPeripheralController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/4/27.
//

import UIKit
import CoreBluetooth

class SelectPeripheralController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tvPeripheral: UITableView!
    
    // MARK: - Property／Variables
    
    let bluetoothService = BluetoothServices.shared
    
    private var peripherals: [CBPeripheral] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bluetoothService.startScan()
        bluetoothService.delegate = self
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        tvPeripheral.delegate = self
        tvPeripheral.dataSource = self
        
        tvPeripheral.register(UINib(nibName: "PeripheralTableViewCell", bundle: nil),
                              forCellReuseIdentifier: PeripheralTableViewCell.identifier)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SelectPeripheralController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeripheralTableViewCell.identifier,
                                                       for: indexPath) as? PeripheralTableViewCell else {
            fatalError("PeripheralTableViewCell Can't Loaded！")
        }
        
        cell.peripheralNameLabel.text = peripherals[indexPath.row].name
        
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        bluetoothService.connectPeripheral(peripheral: peripherals[indexPath.row])
        
        UserPreference.shared.lastPeripheral = peripherals[indexPath.row].name!
        
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - BluetoothServicesDelegate

extension SelectPeripheralController: BluetoothServicesDelegate {
    
    func getBLEPeripherals(peripherals: [CBPeripheral]) {
        self.peripherals = peripherals
        DispatchQueue.main.async {
            self.tvPeripheral.reloadData()
        }
    }
    
//    func getPeripheralAndCharacteristic(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
//    }
}
