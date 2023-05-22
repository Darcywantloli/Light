//
//  DefaultEffectViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/17.
//

import UIKit

class DefaultEffectViewController: UIViewController {

    @IBOutlet weak var effectListTableView: UITableView!
    
    var defauleEffectName = ["跑馬燈"]
    
    var defaultEffectLightCode = ["1:0.1 2:0.1 3:0.1 4:0.1 5:0.1 6:0.1 7:0.1 8:0.1 9:0.1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        self.title = "內建特效"
        
        setupTableView()
    }
    
    private func setupTableView() {
        effectListTableView.delegate = self
        effectListTableView.dataSource = self
        effectListTableView.register(UINib(nibName: "DefaultEffectTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: DefaultEffectTableViewCell.identifier)
    }
}

extension DefaultEffectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if defauleEffectName.count == defaultEffectLightCode.count {
            return defauleEffectName.count
        } else {
            Alert.showAlert(title: "錯誤",
                            message: "特效丟失",
                            vc: self,
                            confirmTitle: "確認")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DefaultEffectTableViewCell.identifier,
                                                 for: indexPath) as! DefaultEffectTableViewCell
        
        let times = Effect.effectCodeDecoder(effectCode: defaultEffectLightCode[indexPath.row]).time
        let totalTime = String(format: "%.2f", ceil(Effect.countTotalTime(times: times) * 100) / 100)
        
        cell.effectNameLabel.text = defauleEffectName[indexPath.row]
        cell.timeLabel.text = "\(totalTime)s"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lightCodeWithTime = Effect.effectCodeDecoder(effectCode: defaultEffectLightCode[indexPath.row])
        let lightCode = lightCodeWithTime.lightCode,
            time = lightCodeWithTime.time
        
        let previewEffect = PreviewEffectViewController()
        
        previewEffect.previewLightCode = lightCode
        previewEffect.previewTime = time
        
        present(previewEffect, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
