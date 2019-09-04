//
//  ListPhoneViewController.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import UIKit

protocol ListPhoneViewControllerInterface: class {
    func displayListPhone(viewModel: ListPhoneModels.GetMobileList.ViewModel)
    func displayNavigateView()
}

class ListPhoneViewController: UIViewController, ListPhoneViewControllerInterface {
    var displayedView: [displayedPhone] = []

    @IBOutlet var tableView: UITableView!
    var interactor: ListPhoneInteractorInterface!
    var router: ListPhoneRouter!
    static let CellIdentifier: String = "PhoneTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getApi(request: ListPhoneModels.GetMobileList.Request())
    }

    func displayListPhone(viewModel: ListPhoneModels.GetMobileList.ViewModel) {
        if viewModel.success {
            displayedView = viewModel.Array
            tableView.reloadData()

        } else {
            createAlert(title: "WARNING", message: "")
        }
    }

    func displayNavigateView() {
        router.navigationtoDetail()
    }

    private func sorting(alertAction: UIAlertAction) {
    }

    @IBAction func actionSort(_ sender: Any) {
        let alert = UIAlertController(title: "AlertController Tutorial",
                                      message: "Sorting",
                                      preferredStyle: .alert)
        let sortLowtoHight = UIAlertAction(title: "Sort Low to Hight", style: .default, handler: { (_) -> Void in
            self.interactor.getApiSorting(request: ListPhoneModels.SortListPhone.Request(sortingCase: .lowtoHight))
            self.tableView.reloadData()
        })
        let sortHighttoLow = UIAlertAction(title: "Sort Hight to Low", style: .default, handler: { (_) -> Void in
            self.interactor.getApiSorting(request: ListPhoneModels.SortListPhone.Request(sortingCase: .highttoLow))
            self.tableView.reloadData()
        })
        let sortRating = UIAlertAction(title: "Rating", style: .default, handler: { (_) -> Void in
            self.interactor.getApiSorting(request: ListPhoneModels.SortListPhone.Request(sortingCase: .rating))
            self.tableView.reloadData()
        })

        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (_) -> Void in })

        alert.addAction(sortLowtoHight)
        alert.addAction(sortHighttoLow)
        alert.addAction(sortRating)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDatatoNextScene(segue: segue)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }

    private func configure(viewController: ListPhoneViewController) {
        let router = ListPhoneRouter()
        router.viewController = viewController

        let presenter = ListPhonePresenter()
        presenter.viewController = viewController

        let interactor = ListPhoneInteractor()
        interactor.presenter = presenter

        viewController.interactor = interactor
        viewController.router = router
    }

    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension ListPhoneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedView.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneTableViewCell.CellIdentifier, for: indexPath) as? PhoneTableViewCell else {
            return UITableViewCell()
        }
        let phone: displayedPhone = displayedView[indexPath.item]
        cell.configCell(phone: phone)
        return cell
    }
}

extension ListPhoneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.selectedPhone(request: getIndex.Request(indexPath: indexPath.row))
    }
}
