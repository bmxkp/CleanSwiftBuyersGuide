//
//  ListPhoneDetailPresenter.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import Foundation

protocol ListPhoneDetailPresenterInterface {
    func presentListDetail(reponse: ListDetailPhoneModels.SetMobileList.Response)
    func presentImages(response: GetImage.Response)
}

class ListPhoneDetailPresenter: ListPhoneDetailPresenterInterface {
    
    func presentImages(response: GetImage.Response) {
        let response: [ApiImages] = response.Array
        let viewImages = GetImage.ViewModel(success: true, Array: response)
        self.viewController.displayImage(viewModel: viewImages)

    }
    
    weak var viewController: ListPhoneDetailViewController!

    func presentListDetail(reponse: ListDetailPhoneModels.SetMobileList.Response) {
        let response: ApiPhone = reponse.item
        let viewModel = ListDetailPhoneModels.SetMobileList.ViewModel(item: response)
        viewController.displayedListPhone(viewModel: viewModel)
    }
    
    
}

