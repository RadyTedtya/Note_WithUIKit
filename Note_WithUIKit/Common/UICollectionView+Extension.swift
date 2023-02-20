//
//  UICollectionView+Extension.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//
import UIKit

extension UICollectionView {
  
    func register<CellType: UICollectionViewCell>(_ type: CellType.Type) {
        register(type.xib, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeue<CellType: UICollectionViewCell>(_ type: CellType.Type, for indexPath: IndexPath) -> CellType {
        return dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as! CellType
    }
}
