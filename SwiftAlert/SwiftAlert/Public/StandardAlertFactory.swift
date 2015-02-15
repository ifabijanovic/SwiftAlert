//
//  StandardAlertFactory.swift
//  SwiftAlert
//
//  Created by Ivan Fabijanovic on 15/02/15.
//  Copyright (c) 2015 Ivan Fabijanović. All rights reserved.
//

import UIKit

class StandardAlertFactory: AlertFactory {
   
    // MARK: - Public methods
    
    func createActionSheet(presenter: UIViewController, title: String, buttons: (style: UIAlertActionStyle, title: String, handler: (() -> ())?)...) -> Alert {
        
        if objc_getClass("UIAlertController") != nil {
            return AlertIOS8(presenter: presenter, title: title, buttons: buttons)
        } else {
            return AlertIOS7(presenter: presenter, title: title, buttons: buttons)
        }

    }
    
    func createAlert(presenter: UIViewController, title: String, message: String, buttons: (style: UIAlertActionStyle, title: String, handler: (() -> ())?)...) -> Alert {
        
        if objc_getClass("UIAlertController") != nil {
            return AlertIOS8(presenter: presenter, title: title, message: message, buttons: buttons)
        } else {
            return AlertIOS7(presenter: presenter, title: title, message: message, buttons: buttons)
        }
        
    }
    
}
