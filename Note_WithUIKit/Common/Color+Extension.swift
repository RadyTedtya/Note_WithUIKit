//
//  Color+Extension.swift
//  Spotify
//
//  Created by Tedtya rady on 4/1/23.
//

import Foundation
import UIKit

extension UIColor {
    
    static let primaryColor = UIColor.init(hex: 0xF1F1F1)
    
    
    static let primaryBackgroundColor = UIColor.init(hex: 0xFBFCFF)
    static let secondaryBackgroundColor = UIColor.init(hex: 0xEDEDED)
    
    static let primaryFontColor = UIColor.init(hex: 0x535353)
    
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(hex: Int) {
       self.init(
           red: (hex >> 16) & 0xFF,
           green: (hex >> 8) & 0xFF,
           blue: hex & 0xFF
       )
   }
}
