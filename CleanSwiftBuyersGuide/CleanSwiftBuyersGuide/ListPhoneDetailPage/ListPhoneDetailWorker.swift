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
    static let shared: ListPhoneDetailWorker = ListPhoneDetailWorker()
    func getApiImages(mobileId: Int, completion: @escaping (Swift.Result<[ApiImages], Error>) -> Void) {
        let baseURL: String = "https://scb-test-mobile.herokuapp.com/api/mobiles/\(mobileId)/images/"
        AF.request(baseURL)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        let ImageSet = try JSONDecoder().decode([ApiImages].self, from: response.data!)
                        completion(.success(ImageSet))
                    } catch let error {
                        completion(.failure(error))
                    }
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
}
