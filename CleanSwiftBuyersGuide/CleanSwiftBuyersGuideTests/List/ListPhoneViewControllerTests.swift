//
//  ListPhoneViewControllerTests.swift
//  CleanSwiftBuyersGuide
//
//  Created by Kanjanaporn on 4/9/2562 BE.
//  Copyright (c) 2562 SCBiOS. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CleanSwiftBuyersGuide
import XCTest

//class ListPhoneViewControllerTests: XCTestCase
//{
//  // MARK: Subject under test
//
//  var sut: ListPhoneViewController!
//  var interacterSpy :
//  var window: UIWindow!
//
//  // MARK: Test lifecycle
//
//  override func setUp()
//  {
//    super.setUp()
//    window = UIWindow()
//    setupListPhoneViewController()
//  }
//
//  override func tearDown()
//  {
//    window = nil
//    super.tearDown()
//  }
//
//  // MARK: Test setup
//
//  func setupListPhoneViewController()
//  {
//    let bundle = Bundle.main
//    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
//    sut = storyboard.instantiateViewController(withIdentifier: "ListPhoneViewController") as! ListPhoneViewController
//  }
//
//  func loadView()
//  {
//    window.addSubview(sut.view)
//    RunLoop.current.run(until: Date())
//  }
//
//  // MARK: Test doubles
//  
//  class ListPhoneInteracterSpy: ListPhoneInteractorInterface
//  {
//
//    func getApi(request: ListPhoneModels.GetMobileList.Request) {
//      <#code#>
//    }
//
//    func getApiSorting(request: ListPhoneModels.SortListPhone.Request) {
//      <#code#>
//    }
//
//    func selectedPhone(request: GetIndex.Request) {
//      <#code#>
//    }
//
//    var phones: [ApiPhone]
//
//    var selectedItem: ApiPhone?
//
//
//  }
//
//  // MARK: Tests
//  
//  func testShouldDoSomethingWhenViewIsLoaded()
//  {
//    // Given
//    let spy = ListPhoneBusinessLogicSpy()
//    sut.interactor = spy
//    
//    // When
//    loadView()
//    
//    // Then
//    XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
//  }
//  
//  func testDisplaySomething()
//  {
//    // Given
//    let viewModel = ListPhone.Something.ViewModel()
//    
//    // When
//    loadView()
//    sut.displaySomething(viewModel: viewModel)
//    
//    // Then
//    //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
//  }
