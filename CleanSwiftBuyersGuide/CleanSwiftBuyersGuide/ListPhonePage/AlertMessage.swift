//
//  AlertMessage.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 3/9/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import UIKit

class AlertMessage: UIViewController {

    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}
