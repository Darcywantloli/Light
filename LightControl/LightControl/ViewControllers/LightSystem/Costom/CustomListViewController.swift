//
//  CustomListViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/17.
//

import UIKit
import RealmSwift

class CustomListViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var effectListTableView: UITableView!
    
    // MARK: - Variables
    
    var effects: [Light] = []
    
    private let previewEffect = PreviewEffect()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.fetchDataFromDatabase()
        }
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        self.title = "自定義特效"
        
        setupTableView()
        setupRightBarButtonItem()
    }
    
    private func setupTableView() {
        effectListTableView.delegate = self
        effectListTableView.dataSource = self
        effectListTableView.register(UINib(nibName: "CustomEffectTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: CustomEffectTableViewCell.identifier)
    }
    
    private func setupRightBarButtonItem() {
        let addButton = UIBarButtonItem(title: "新增組合",
                                        style: .plain,
                                        target: self,
                                        action: #selector(addEffect))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: - Function
    
    private func fetchDataFromDatabase() {
        let realm = try! Realm()
        let results = realm.objects(Light.self)
        
        if results.count > 0 {
            effects = []
            results.forEach { light in
                effects.append(light)
            }
            effectListTableView.reloadData()
        }
    }
    
    @objc func addEffect() {
        let nextVC = EffectListViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CustomListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return effects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomEffectTableViewCell.identifier,
                                                 for: indexPath) as! CustomEffectTableViewCell
        let times = Effect.effectCodeDecoder(effectCode: effects[indexPath.row].lightCode).time
        let totalTime = String(format: "%.2f", ceil(Effect.countTotalTime(times: times) * 100) / 100)
        
        cell.effectTimeLabel.text = effects[indexPath.row].name
        cell.timeLabel.text = "\(totalTime)s"
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let lightCodeWithTime = Effect.effectCodeDecoder(effectCode: effects[indexPath.row].lightCode)
        let lightCode = lightCodeWithTime.lightCode
        let time = lightCodeWithTime.time
        
        previewEffect.timeControl(lightCode: lightCode,
                                  times: time,
                                  bluetoothService: BluetoothServices.shared)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
