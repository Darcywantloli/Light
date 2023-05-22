//
//  DefaultEffectViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/17.
//

import UIKit

class DefaultEffectViewController: UIViewController {

    @IBOutlet weak var effectListTableView: UITableView!
    
    var effectCode = "1:1 12:1 123:1 1234:1 12345:1 123456:1 1234567:1 12345678:1 123456789:1"
    
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DefaultEffectTableViewCell.identifier,
                                                 for: indexPath) as! DefaultEffectTableViewCell
        cell.effectNameLabel.text = "跑馬燈"
        cell.timeLabel.text = "10s"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lightCodeAndTime = Effect.effectCodeDecoder(effectCode: effectCode)
        let lightCode = lightCodeAndTime.lightCode,
            time = lightCodeAndTime.time
        
        let previewEffect = PreviewEffectViewController()
        
        previewEffect.previewLightCode = lightCode
        previewEffect.previewTime = time
        
        present(previewEffect, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
