//
//  Alert.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/8.
//

import UIKit

class Alert {
    static func showAlert(title: String,
                          message: String,
                          vc: UIViewController,
                          confirmTitle: String,
                          confirm: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: confirmTitle,
                                              style: .default) { action in confirm?() }
            
            alertController.addAction(confirmAction)
            vc.present(alertController, animated: true)
        }
    }
}
