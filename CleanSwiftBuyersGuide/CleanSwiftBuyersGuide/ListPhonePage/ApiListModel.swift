//
//  ApiModel.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import Foundation
import SwiftyJSON

//import SwiftyJSON
struct ApiPhone: Equatable {
    let id : Int
    let name: String
    let price: Float
    let thumbImageURL: String
    let rating: Float
    let description: String
}

extension ApiPhone {
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        price = json["price"].floatValue
        rating = json["rating"].floatValue
        description = json["description"].stringValue
        thumbImageURL = json["thumbImageURL"].stringValue
    }
}


