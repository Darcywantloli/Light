//
//  MessageSystemViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/16.
//

import UIKit

class MessageSystemViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.title = "文字傳送"
        
        setupLabel()
        setupButton()
        setupTextField()
        setupTapGestureRecognizer()
    }
    
    private func setupLabel() {
        titleLabel.text = "在下方輸入想要顯示的訊息"
    }
    
    private func setupButton() {
        sendButton.backgroundColor = .systemBlue
        sendButton.setTitle("送出", for: .normal)
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.layer.cornerRadius = sendButton.frame.height / 6
    }
    
    private func setupTextField() {
        messageTextField.textColor = .black
        messageTextField.placeholder = "顯示的訊息"
        messageTextField.backgroundColor = .lightGray
    }
    
    private func setupTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        let message = messageTextField.text
        let testLCd = "\(message!)".data(using: .utf8)
        
        BluetoothServices.shared.writeValue(type: .withoutResponse, data: testLCd!)
    }
    
}
