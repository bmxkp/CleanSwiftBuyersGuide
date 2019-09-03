//
//  ListPhoneDetailModel.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import Foundation

enum ListDetailPhoneModels {
    struct SetMobileList {
        struct Request {
        }

        struct Response {
            var item: ApiPhone
        }

        struct ViewModel {
            var item: ApiPhone
        }
    }
}

struct GetImage {
    struct Request {
    }

    struct Response {
        var success: Bool
        var Array: Array<ApiImages>
    }

    struct ViewModel {
        var success: Bool
        var Array: Array<ApiImages>
    }
}
