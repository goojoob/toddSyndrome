//
//  customButton.swift
//  toddSyndrome
//
//  Created by Antonio Rodriguez Cia on 1/11/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import UIKit

class customButton: UIButton {

    fileprivate let customColor = UIColor(netHex: 0xEFBE19)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.titleEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 0
        self.layer.borderColor = customColor.cgColor
        
        self.backgroundColor = UIColor.clear
        self.setTitleColor(customColor, for: UIControlState.normal)
        self.alpha = 0
        self.isEnabled = true
    }
    
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                self.alpha = 0.5
            } else {
                self.alpha = 1
            }
        }
    }

}
