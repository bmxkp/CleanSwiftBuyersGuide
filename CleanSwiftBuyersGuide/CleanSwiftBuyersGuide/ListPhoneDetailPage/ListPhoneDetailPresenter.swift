//
//  ListPhoneDetailPresenter.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import Foundation

protocol ListPhoneDetailPresenterInterface {
    func presentListDetail(reponse: ListPhoneDetailModels.SetMobileList.Response)
    func presentImages(response: GetImage.Response)
    func presentAlertMessage()
}

class ListPhoneDetailPresenter: ListPhoneDetailPresenterInterface {
    weak var viewController: ListPhoneDetailViewControllerInterface!

    func presentAlertMessage() {
        self.viewController.displayAlertMaeesage()
    }

    func presentImages(response: GetImage.Response) {
        let response: [ApiImages] = response.Array
        let viewImages = GetImage.ViewModel(success: true, Array: response)
        viewController.displayImage(viewModel: viewImages)
    }

    func presentListDetail(reponse: ListPhoneDetailModels.SetMobileList.Response) {
        let response: ApiPhone = reponse.item
        let viewModel = ListPhoneDetailModels.SetMobileList.ViewModel(item: response)
        viewController.displayedListPhone(viewModel: viewModel)
    }
}
