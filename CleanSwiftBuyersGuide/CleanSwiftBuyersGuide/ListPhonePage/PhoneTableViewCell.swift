//
//  PhoneTableViewCell.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 2/9/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//


import UIKit
import Kingfisher

class PhoneTableViewCell: UITableViewCell {
    static let CellIdentifier: String = "PhoneTableViewCell"
    
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(phone: displayedPhone) {
        nameLabel.text = phone.name
        descriptLabel.text = phone.description
        priceLabel.text = "Price: $\(phone.price)"
        ratingLabel.text = "Rating: \(phone.rating)"
        phoneImageView.kf.setImage(with: URL(string: phone.thumbImageURL))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        phoneImageView.image = nil
    }
}

