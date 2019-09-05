//
//  ListPhoneWorker.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 30/8/2562 BE.
//  Copyright © 2562 SCBiOS. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

protocol APIManagerProtocol {
    func getPhoneInfo(completion: @escaping (Swift.Result<[ApiPhone], Error>) -> Void)
}

class ListPhoneWorker: APIManagerProtocol {

    func getPhoneInfo(completion: @escaping (Swift.Result<[ApiPhone], Error>) -> Void) {
        let baseURL: String = "https://scb-test-mobile.herokuapp.com/api/mobiles/"
        AF.request(baseURL)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        let json = try JSON(data: response.data!)
                        let phones: [ApiPhone] = json.arrayValue.compactMap({ ApiPhone(json: $0) })
                        completion(.success(phones))
                    } catch (let error) {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
