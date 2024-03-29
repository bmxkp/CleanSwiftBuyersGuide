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
    func displayAlertMaeesage()
}

class ListPhoneViewController: UIViewController, ListPhoneViewControllerInterface {
    var displayedView: [DisplayedPhone] = []

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
            displayAlertMaeesage()
        }
    }

    func displayNavigateView() {
        router.navigationtoDetail()
    }

    private func sorting(sortingCase: ListPhoneModels.SortListPhone.sortingCase) {
        let cases = ListPhoneModels.SortListPhone.Request(sortingCase: sortingCase)
        interactor.getApiSorting(request: cases)
        tableView.reloadData()
    }

    @IBAction func actionSort(_ sender: Any) {
        let alert = UIAlertController(title: "AlertController Tutorial",
                                      message: "Sorting",
                                      preferredStyle: .alert)
        let sortLowtoHight = UIAlertAction(title: "Sort Low to Hight", style: .default, handler: { (_) -> Void in
            self.sorting(sortingCase: .lowtoHight)
        })
        let sortHighttoLow = UIAlertAction(title: "Sort Hight to Low", style: .default, handler: { (_) -> Void in
            self.sorting(sortingCase: .highttoLow)

        })
        let sortRating = UIAlertAction(title: "Rating", style: .default, handler: { (_) -> Void in
            self.sorting(sortingCase: .rating)

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

    func displayAlertMaeesage() {
        let alert = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(dismissAction)
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
        let phone: DisplayedPhone = displayedView[indexPath.item]
        cell.configCell(phone: phone)
        return cell
    }
}

extension ListPhoneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.selectedPhone(request: GetIndex.Request(indexPath: indexPath.row))
    }
}
