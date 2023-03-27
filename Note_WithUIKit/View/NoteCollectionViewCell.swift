//
//  NoteCollectionViewCell.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 27/3/2023.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellButton()
    
    }
    

    
    override var isSelected: Bool {
        didSet {
            self.contentView.backgroundColor = isSelected ? UIColor.blue : UIColor.yellow
            self.cellButton.alpha = isSelected ? 0.75 : 1.0
        }
      }
    
    func setupCellButton() {
        cellButton.titleLabel?.backgroundColor = .white
        cellButton.imageView?.backgroundColor = .secondaryColor
        
    }


}
