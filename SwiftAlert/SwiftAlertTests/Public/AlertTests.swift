//
//  AlertTests.swift
//  SwiftAlert
//
//  Created by Ivan Fabijanovic on 01/03/15.
//  Copyright (c) 2015 Ivan Fabijanović. All rights reserved.
//

import UIKit
import XCTest

class AlertTests: XCTestCase {
    
    let presenter = UIViewController()
    
    func testInit() {
        let buttons: Array<(style: UIAlertActionStyle, title: String, handler:(() -> ())?)> = []
        let alert = Alert(presenter: presenter, buttons: buttons)
        
        XCTAssertEqual(alert.presenter, presenter, "")
        XCTAssertEqual(alert.style, UIAlertControllerStyle.Alert, "")
        XCTAssertEqual(alert.buttons.count, 0, "")
    }
    
    func testInitAlert() {
        let buttons: Array<(style: UIAlertActionStyle, title: String, handler:(() -> ())?)> = []
        let title = "Alert"
        let message = "Message"
        let alert = Alert(presenter: presenter, title: title, message: message, buttons: buttons)
        
        XCTAssertEqual(alert.presenter, presenter, "")
        XCTAssertEqual(alert.style, UIAlertControllerStyle.Alert, "")
        XCTAssertNotNil(alert.title, "")
        XCTAssertEqual(alert.title!, title, "")
        XCTAssertNotNil(alert.message, "")
        XCTAssertEqual(alert.message!, message, "")
        XCTAssertEqual(alert.buttons.count, 0, "")
    }
    
    func testInitActionSheet() {
        let buttons: Array<(style: UIAlertActionStyle, title: String, handler:(() -> ())?)> = []
        let title = "Action Sheet"
        let alert = Alert(presenter: presenter, title: title, buttons: buttons)
        
        XCTAssertEqual(alert.presenter, presenter, "")
        XCTAssertEqual(alert.style, UIAlertControllerStyle.ActionSheet, "")
        XCTAssertNotNil(alert.title, "")
        XCTAssertEqual(alert.title!, title, "")
        XCTAssertEqual(alert.buttons.count, 0, "")
    }
    
    func testInitAssignsButtons() {
        let expectCancel = expectationWithDescription("")
        let expectDefault = expectationWithDescription("")
        let buttons: Array<(style: UIAlertActionStyle, title: String, handler:(() -> ())?)> = [
            (style: .Cancel, title: "Cancel", handler: { expectCancel.fulfill() }),
            (style: .Default, title: "Default", handler: { expectDefault.fulfill() })
        ]
        let alert = Alert(presenter: presenter, buttons: buttons)
        
        XCTAssertEqual(alert.buttons.count, buttons.count, "")
        for index in 0..<alert.buttons.count {
            XCTAssertEqual(alert.buttons[index].style, buttons[index].style, "")
            XCTAssertEqual(alert.buttons[index].title, buttons[index].title, "")
            alert.buttons[index].handler!()
        }
        
        waitForExpectationsWithTimeout(3, handler: { error in
            if error != nil {
                XCTFail("")
            }
        })
    }

}
