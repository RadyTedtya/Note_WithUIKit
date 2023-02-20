//
//  UITableView+Extension.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import UIKit

extension UITableView {
    
    func register<CellType: UITableViewCell>(_ type: CellType.Type) {
        register(type.xib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeue<CellType: UITableViewCell>(_ type: CellType.Type, for indexPath: IndexPath) -> CellType {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as! CellType
    }
    
}

