//
//  Utilities.swift
//  toddSyndrome
//
//  Created by Antonio Rodriguez Cia on 31/10/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var isNumber: Bool {
        return Int(self) != nil
    }
    
    var isEmpty: Bool {
        return self == ""
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red components")
        assert(green >= 0 && green <= 255, "Invalid green components")
        assert(blue >= 0 && blue <= 255, "Invalid blue components")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
