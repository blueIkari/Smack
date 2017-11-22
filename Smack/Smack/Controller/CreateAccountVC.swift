//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Manuel Josafat Gomez Ituarte on 11/19/17.
//  Copyright © 2017 Blueikari. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    
}
