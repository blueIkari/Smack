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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    // Variables
    var avatarName = "ProfileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != ""{
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && backgroundColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }


    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
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
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                print("made it", UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
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
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2){
            self.userImage.backgroundColor = self.backgroundColor
        }
    }
    
    func setupView(){
        spinner.isHidden = true
        userNameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
}
