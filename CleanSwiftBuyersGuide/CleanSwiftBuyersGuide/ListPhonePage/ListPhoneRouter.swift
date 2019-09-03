//
//  ListPhoneRouter.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import UIKit
protocol ListPhoneRouterInput {
    func navigationtoDetail()
}

class ListPhoneRouter {
    weak var viewController: ListPhoneViewController!
    let identifierTable = "listDetail"
    func passDatatoNextScene(segue: UIStoryboardSegue, displayview: [Any]) {
        if segue.identifier == identifierTable {
           let destinationVC = segue.destination as? ListPhoneDetailViewController
                destinationVC?.interactor.selectedPhones = viewController.interactor.selectedItem
        }
    }

    func navigationtoDetail() {
        viewController.performSegue(withIdentifier: identifierTable, sender: nil)
    }
}
