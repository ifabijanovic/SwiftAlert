//
//  TestAlertTests.swift
//  SwiftAlert
//
//  Created by Ivan Fabijanovic on 16/02/15.
//  Copyright (c) 2015 Ivan Fabijanović. All rights reserved.
//

import UIKit
import XCTest

class TestAlertTests: XCTestCase {

    // MARK: - Properties
    
    var factory: AlertFactory!
    
    override func setUp() {
        super.setUp()
        self.factory = TestAlertFactory()
    }

    func testAlertFiresDefault() {
        let expectation = expectationWithDescription("")
        let alert = self.factory.createAlert(UIViewController(), title: "", message: "", buttons: (style: .Default, title: "", {
            expectation.fulfill()
        }))
        
        waitForExpectationsWithTimeout(10) { error in
            XCTAssertTrue(true, "")
        }
    }

}
