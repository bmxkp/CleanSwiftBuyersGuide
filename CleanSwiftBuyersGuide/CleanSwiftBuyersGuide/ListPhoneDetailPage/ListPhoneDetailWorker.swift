//
//  ListPhoneDetailWorker.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

protocol APIManagerProtocolImages {
    func getApiImages(mobileId: Int, completion: @escaping (Swift.Result<[ApiImages], Error>) -> Void)
}

class ListPhoneDetailWorker: APIManagerProtocolImages {
    func getApiImages(mobileId: Int, completion: @escaping (Swift.Result<[ApiImages], Error>) -> Void) {
        let baseURL: String = "https://scb-test-mobile.herokuapp.com/api/mobiles/\(mobileId)/images/"
        AF.request(baseURL)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        let json = try JSON(data: response.data!)
                        let imageSet: [ApiImages] = json.arrayValue.compactMap({ ApiImages(json: $0) })
                        completion(.success(imageSet))
                    } catch let error {
                        completion(.failure(error))
                    }
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
}
