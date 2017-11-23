//
//  RoundedButton.swift
//  Smack
//
//  Created by Manuel Josafat Gomez Ituarte on 11/22/17.
//  Copyright © 2017 Blueikari. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
  
    override func awakeFromNib() {
        self.setView()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setView()
    }
    func setView(){
        self.layer.cornerRadius = cornerRadius
    }
}
