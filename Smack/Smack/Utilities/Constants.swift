//
//  Constants.swift
//  Smack
//
//  Created by Manuel Josafat Gomez Ituarte on 11/18/17.
//  Copyright © 2017 Blueikari. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL constants
let BASE_URL = "https://chattychattest.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
