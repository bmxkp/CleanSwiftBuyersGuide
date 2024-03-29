//
//  ListPhoneInteractor.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import UIKit
protocol ListPhoneInteractorInterface {
    func getApi(request: ListPhoneModels.GetMobileList.Request)
    func getApiSorting(request: ListPhoneModels.SortListPhone.Request)
    func selectedPhone(request: GetIndex.Request)
    var phones: [ApiPhone] { get set }
    var selectedItem: ApiPhone? { get set }
}

class ListPhoneInteractor: ListPhoneInteractorInterface {
    var selectedItem: ApiPhone?
    var phones: [ApiPhone] = []
    var presenter: ListPhonePresenterInterface!
    var selectedPhone: DisplayedPhone?
    var worker: ListPhoneWorker = ListPhoneWorker()

    func selectedPhone(request: GetIndex.Request) {
        selectedItem = phones[request.indexPath]
        presenter.presentNavigate()
    }

    func getApi(request: ListPhoneModels.GetMobileList.Request) {
        worker.getPhoneInfo { [weak self] result in
            switch result {
            case let .success(phones):
                self?.phones = phones
                let response = ListPhoneModels.GetMobileList.Response(success: true, Array: phones)
                self?.presenter.presentListPhone(response: response)
            case .failure:
                self?.presenter.presentAlertMaeesage()
            }
        }
    }

    func getApiSorting(request: ListPhoneModels.SortListPhone.Request) {
        switch request.sortingCase {
        case .lowtoHight:
            phones = phones.sorted(by: { $0.price < $1.price })
            var sortingPhones = ListPhoneModels.SortListPhone.Response(Array: phones)
            presenter.presentListPhoneSorting(response: sortingPhones)
        case .highttoLow:
            phones = phones.sorted(by: { $0.price > $1.price })
            var sortingPhones = ListPhoneModels.SortListPhone.Response(Array: phones)
            presenter.presentListPhoneSorting(response: sortingPhones)

        case .rating:
            phones = phones.sorted(by: { $0.rating > $1.rating })
            var sortingPhones = ListPhoneModels.SortListPhone.Response(Array: phones)
            presenter.presentListPhoneSorting(response: sortingPhones)
        default:
            presenter.presentAlertMaeesage()
        }
    }
}
