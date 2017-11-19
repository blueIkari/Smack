//
//  ChannelVC.swift
//  Smack
//
//  Created by Manuel Josafat Gomez Ituarte on 11/18/17.
//  Copyright © 2017 Blueikari. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

  

}
