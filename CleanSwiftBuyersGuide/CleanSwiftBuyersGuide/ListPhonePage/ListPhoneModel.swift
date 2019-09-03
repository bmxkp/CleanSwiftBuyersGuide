//
//  ListPhoneModel.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import Foundation
import SwiftyJSON

enum ListPhoneModels {
    struct GetMobileList {
        struct Request {
        }

        struct Response {
            var success: Bool
            var Array: Array<ApiPhone>
        }

        struct ViewModel {
            var success: Bool
            var Array: Array<displayedPhone>
        }
    }

    struct SortListPhone {
        enum sortingCase{
            case lowtoHight
            case highttoLow
            case rating
        }
        struct Request {
            var sortingCase: sortingCase
        }

        struct Response {

            var Array: Array<ApiPhone>
        }

        struct ViewModel {
           
            var Array: Array<displayedPhone>
        }
    }


}


struct displayedPhone {
    let id: Int
    let name: String
    let price: Float
    let thumbImageURL: String
    let rating: Float
    let description: String
}

struct getIndex {
    
    struct Request {
        var indexPath: Int
    }
}


