//
//  ListPhoneDetailViewController.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import UIKit

protocol ListPhoneViewDetailControllerInterface: class {
    func displayedListPhone(viewModel: ListDetailPhoneModels.SetMobileList.ViewModel)
    func displayImage(viewModel: GetImage.ViewModel)
}

class ListPhoneDetailViewController: UIViewController, ListPhoneViewDetailControllerInterface,  UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet var descriptLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var sliderCollection: UICollectionView!
    @IBOutlet var viewCell: UIView!


    var router: ListPhoneDetailRouter!
    var interactor: ListPhoneDetailInteractorInterface!
    var phones: displayedPhone?
    var phone: ApiPhone?
    var displayedImages: [ApiImages] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = ListDetailPhoneModels.SetMobileList.Request()
        let requestImage = GetImage.Request()
        interactor.getData(Request: request)
        interactor.getApiImages(request: requestImage)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }

    func displayImage(viewModel: GetImage.ViewModel) {
        if viewModel.success {
            displayedImages = viewModel.Array
            self.sliderCollection.reloadData()

        } else {
//            createAlert(title: "WARNING", message: "")
        }
    }

    func displayedListPhone(viewModel: ListDetailPhoneModels.SetMobileList.ViewModel) {
        phone = viewModel.item
        title = phone?.name
        descriptLabel.text = phone?.description
        ratingLabel.text = "Rating: \(phone?.rating)"
        priceLabel.text = "Price: $\(phone?.price)"
    }

    private func configure(viewController: ListPhoneDetailViewController) {
        let router = ListPhoneDetailRouter()
        router.viewController = viewController

        let presenter = ListPhoneDetailPresenter()
        presenter.viewController = viewController

        let interactor = ListPhoneDetailInteractor()
        interactor.presenter = presenter

        viewController.interactor = interactor
        viewController.router = router
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        let image: ApiImages = displayedImages[indexPath.row]
        if image.url.contains("http") || image.url.contains("https"){
            cell.imageView.kf.setImage(with: URL(string: image.url))
        }
        else {
            cell.imageView.kf.setImage(with: URL(string: "http://\(image.url)"))
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
}
