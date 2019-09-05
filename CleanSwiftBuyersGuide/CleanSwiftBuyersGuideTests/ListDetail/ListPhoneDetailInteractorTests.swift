//
//  ListPhoneDetailInteractorTests.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 5/9/2562 BE.
//  Copyright (c) 2562 SCBiOS. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CleanSwiftBuyersGuide
import XCTest

class ListPhoneDetailInteractorTests: XCTestCase {
    // MARK: Subject under test

    var sut: ListPhoneDetailInteractor!
    var presenterSpy: ListPhoneDetailPresenterSpy!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupListPhoneDetailInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupListPhoneDetailInteractor() {
        sut = ListPhoneDetailInteractor()
        presenterSpy = ListPhoneDetailPresenterSpy()
        sut.presenter = presenterSpy
    }

    // MARK: Test doubles

    class ListPhoneDetailPresenterSpy: ListPhoneDetailPresenterInterface {
        var listResponse: ListPhoneDetailModels.SetMobileList.Response?
        var imageResponse: GetImage.Response?
        func presentListDetail(reponse: ListPhoneDetailModels.SetMobileList.Response) {
            listResponse = reponse
        }

        func presentImages(response: GetImage.Response) {
            imageResponse = response
        }
    }

    class workerSpy: ListPhoneDetailWorker {
//    let mobileid = 1
        override func getApiImages(mobileId: Int, completion: @escaping (Result<[ApiImages], Error>) -> Void) {
            completion(.success([ApiImages(url: "https", id: 2, mobileID: 2)]))
        }
    }

    // MARK: Tests

    func testApiImages() {
//    given
        sut.worker = workerSpy()
        let request = GetImage.Request()
        sut.selectedPhones = ApiPhone(id: 1, name: "Moto", price: 199.9, thumbImageURL: "", rating: 5.4, description: "")

//    when
        sut.getApiImagesData(request: request)

        //  then
        if let request = presenterSpy.imageResponse {
            let image = ApiImages(url: "https", id: 2, mobileID: 2)
            XCTAssertEqual(request.success, true)
            XCTAssertEqual(request.Array, [image])
        }
    }

    func testGetData() {
//      given
      let request = ListPhoneDetailModels.SetMobileList.Request()
//      when
      sut.getData(Request: request)
//      then
      if let request = presenterSpy.listResponse {
        let selectPhone = ApiPhone(id: 1, name: "Moto", price: 199.9, thumbImageURL: "", rating: 5.4, description: "")
        XCTAssertEqual(request.item, selectPhone )
      }

    }
}
