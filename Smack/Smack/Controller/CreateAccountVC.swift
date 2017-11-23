//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Manuel Josafat Gomez Ituarte on 11/19/17.
//  Copyright © 2017 Blueikari. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass){
            (success) in
            if success{
                print("registered user!")
            }
        }
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
    }
    
}
