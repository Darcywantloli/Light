//
//  EffectListViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/18.
//

import UIKit

class EffectListViewController: UIViewController {

    @IBOutlet weak var componentsTableView: UITableView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.title = "新增組合"
        
        setupButton()
        setupTableView()
        setupRightBarButtonItems()
    }
    
    
    private func setupButton() {
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("儲存", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = saveButton.frame.height / 6
    }
    
    private func setupTableView() {
        componentsTableView.delegate = self
        componentsTableView.dataSource = self
        componentsTableView.register(UINib(nibName: "EffectComponentTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: EffectComponentTableViewCell.identifier)
    }
    
    private func setupRightBarButtonItems() {
        let addButton = UIBarButtonItem(title: "新增特效",
                                        style: .plain,
                                        target: self, action: #selector(addEffectComponents))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addEffectComponents() {
        let nextVC = CustomEffectViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func saveCustomEffect(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension EffectListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EffectComponentTableViewCell.identifier,
                                                 for: indexPath) as! EffectComponentTableViewCell
        
        cell.firstLightImageView.image = UIImage(systemName: "lightbulb")
        cell.secondLightImageView.image = UIImage(systemName: "lightbulb")
        cell.thirdLightImageView.image = UIImage(systemName: "lightbulb")
        cell.fourthLightImageView.image = UIImage(systemName: "lightbulb")
        cell.fifthLightImageView.image = UIImage(systemName: "lightbulb")
        cell.sixthLightImageView.image = UIImage(systemName: "lightbulb")
        cell.seventhLightImageView.image = UIImage(systemName: "lightbulb")
        cell.eighthLightImageView.image = UIImage(systemName: "lightbulb")
        cell.ninethLightImageView.image = UIImage(systemName: "lightbulb")
        
        cell.timeLabel.text = "0.5s"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
