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
let LOGIN_USER = "\(BASE_URL)/account/login"
let URL_USER_ADD = "\(BASE_URL)/user/add"

//Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.3647058824, green: 0.4045833051, blue: 0.8775706887, alpha: 0.5)

// Notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataDidChange")

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


//Headers
let HEADER  = [
    "Content-Type":"application/json; charset=utf-8"
]
