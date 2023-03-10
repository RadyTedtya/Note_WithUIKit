//
//  NoteTypeCollectionViewCell.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 19/2/2023.
//

import UIKit

class NoteTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellButton: UIButton!
    
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                backgroundColor = .blue
            } else {
                backgroundColor = .primaryColor
            }
            
            if isSelected {
                cellButton.tintColor = .primaryBackgroundColor
                cellButton.titleLabel?.tintColor = .red
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpButton()
        
    }
    
    func setUpButton() {
        cellButton.titleLabel?.tintColor = .red
        
    }
    
}
