//
//  ListPhoneDetailInteractor.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import UIKit

protocol ListPhoneDetailInteractorInterface {
    func getData(Request: ListPhoneDetailModels.SetMobileList.Request)
    func getApiImagesData(request: GetImage.Request)
    var selectedPhones: ApiPhone? { get set }
}

class ListPhoneDetailInteractor: ListPhoneDetailInteractorInterface {
    var selectedPhones: ApiPhone?
    var images: [ApiImages] = []
    var worker: ListPhoneDetailWorker = ListPhoneDetailWorker()

    weak var viewController: ListPhoneDetailViewController!
    var presenter: ListPhoneDetailPresenterInterface!

    func getData(Request: ListPhoneDetailModels.SetMobileList.Request) {
        let phones = selectedPhones
        guard let phone = phones else {
            return
        }
        let response = ListPhoneDetailModels.SetMobileList.Response(item: phone)
        presenter.presentListDetail(reponse: response)
    }

    func getApiImagesData(request: GetImage.Request) {
        guard let phone = selectedPhones else {
            return
        }
        worker.getApiImages(mobileId: phone.id) { [weak self] result in
            switch result {
            case let .success(image):
                self?.images = image
                let response = GetImage.Response(success: true, Array: image)
                self?.presenter.presentImages(response: response)
            case let .failure(error):
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(dismissAction)
            }
        }
    }
}
