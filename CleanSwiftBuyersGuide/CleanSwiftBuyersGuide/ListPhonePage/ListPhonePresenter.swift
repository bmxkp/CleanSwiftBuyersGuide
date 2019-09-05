//
//  ListPhonePresenter.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//
import UIKit

protocol ListPhonePresenterInterface {
    func presentListPhone(response: ListPhoneModels.GetMobileList.Response)
    func presentListPhoneSorting(response: ListPhoneModels.SortListPhone.Response)
    func presentNavigate()
    func presentAlertMaeesage()
}

class ListPhonePresenter: ListPhonePresenterInterface {
  func presentAlertMaeesage() {
    self.viewController.displayAlertMaeesage()
  }
  
    weak var viewController: ListPhoneViewControllerInterface!

    func presentNavigate() {
        viewController.displayNavigateView()
    }

    func presentListPhoneSorting(response: ListPhoneModels.SortListPhone.Response) {
        let displayedPhoneReponse: [DisplayedPhone] = response.Array.map { phone in
            DisplayedPhone(id: phone.id, name: phone.name, price: phone.price, thumbImageURL: phone.thumbImageURL, rating: phone.rating, description: phone.description)
        }
        let displayedPhoneView = ListPhoneModels.GetMobileList.ViewModel(success: true, Array: displayedPhoneReponse)
        viewController.displayListPhone(viewModel: displayedPhoneView)
    }

    func presentListPhone(response: ListPhoneModels.GetMobileList.Response) {
        let displayedPhoneReponse: [DisplayedPhone] = response.Array.map { phone in
            DisplayedPhone(id: phone.id, name: phone.name, price: phone.price, thumbImageURL: phone.thumbImageURL, rating: phone.rating, description: phone.description)
        }
        let displayedPhoneView = ListPhoneModels.GetMobileList.ViewModel(success: true, Array: displayedPhoneReponse)
        viewController.displayListPhone(viewModel: displayedPhoneView)
    }
}
