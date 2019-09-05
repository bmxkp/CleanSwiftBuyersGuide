//
//  ApiImagesModel.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 3/9/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import SwiftyJSON
import UIKit

struct ApiImages: Equatable {
    let url: String
    let id: Int
    let mobileID: Int
}

extension ApiImages {
    init(json: JSON) {
        url = json["url"].stringValue
        id = json["id"].intValue
        mobileID = json["mobile_id"].intValue
    }
}
