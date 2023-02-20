//
//  UITableViewCell+Extension.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var xib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
}
