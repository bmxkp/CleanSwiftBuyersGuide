//
//  ApiImagesModel.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 3/9/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import SwiftyJSON
import UIKit

typealias Model = [ApiImages]

struct ApiImages: Codable {
    let url: String
    let id, mobileID: Int

    enum CodingKeys: String, CodingKey {
        case url, id
        case mobileID = "mobile_id"
    }
}
