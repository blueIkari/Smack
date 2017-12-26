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
    // Variables
    var  avatarName = "ProfileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = userNameText.text , userNameText.text != "" else { return }
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass){
            (success) in
            if success{
                print("registered user!")
                AuthService.instance.loginUser(email: email, password: pass, completion: {(success) in
                    if success{
                        print("Logged in user",  AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            print("start")
                            if success{
                                print("made it", UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            } else{
                                print("Not successful!")
                            }
                        })
                    }else{
                        print(" tengo error");
                    }
                    
                })
            }
        }
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
    }
    
}
