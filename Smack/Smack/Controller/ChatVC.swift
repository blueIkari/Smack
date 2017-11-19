//
//  ChatVC.swift
//  Smack
//
//  Created by Manuel Josafat Gomez Ituarte on 11/18/17.
//  Copyright © 2017 Blueikari. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlets
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }

  

}
