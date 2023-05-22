//
//  CustomListViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/17.
//

import UIKit

class CustomListViewController: UIViewController {
    
    @IBOutlet weak var effectListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
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
    
    @objc func addEffect() {
        let nextVC = EffectListViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension CustomListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomEffectTableViewCell.identifier,
                                                 for: indexPath) as! CustomEffectTableViewCell
        cell.effectTimeLabel.text = "自定義1"
        cell.timeLabel.text = "10s"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Alert.showAlert(title: "通知",
                        message: "已新增此特效，請至特效預覽查看",
                        vc: self,
                        confirmTitle: "確認") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
