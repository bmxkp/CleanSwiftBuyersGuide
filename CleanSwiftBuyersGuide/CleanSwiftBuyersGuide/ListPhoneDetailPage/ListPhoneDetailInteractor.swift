//
//  ListPhoneDetailInteractor.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import Foundation

protocol ListPhoneDetailInteractorInterface {
    func getData(Request: ListDetailPhoneModels.SetMobileList.Request)
    func getApiImages(request: GetImage.Request)
    var selectedPhones: ApiPhone? { get set }
}

class ListPhoneDetailInteractor: ListPhoneDetailInteractorInterface {
    var selectedPhones: ApiPhone?
    var images: [ApiImages] = []

    weak var viewController: ListPhoneDetailViewController!
    var presenter: ListPhoneDetailPresenterInterface!

    func getData(Request: ListDetailPhoneModels.SetMobileList.Request) {
        let phones = selectedPhones
        let response = ListDetailPhoneModels.SetMobileList.Response(item: phones!)
        presenter.presentListDetail(reponse: response)
    }

    func getApiImages(request: GetImage.Request) {
        ListPhoneDetailWorker.shared.getApiImages(mobileId: selectedPhones!.id) { [weak self] result in
            switch result {
            case let .success(image):
                self?.images = image
                let response = GetImage.Response(success: true, Array: image)
                self?.presenter.presentImages(response: response)
            case let .failure(error): break
//                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
//                let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alert.addAction(dismissAction)
//                self?.present(alert, animated: true)
            }
        }
    }
}
