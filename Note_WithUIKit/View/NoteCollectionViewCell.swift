//
//  NoteCollectionViewCell.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 27/3/2023.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSelectedCell()
    }
    
    override var isSelected: Bool {
        didSet {
            textLabel.textColor = isSelected ? .white : .black
        }
    }
    
    func setupSelectedCell() {
        
        textLabel.font = UIFont(name: UIFont.systemFontSize.description, size: 14)
        let backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = UIColor.primaryColor
        self.backgroundView = backgroundView

        let selectedBackgroundView = UIView(frame: bounds)
        selectedBackgroundView.backgroundColor = UIColor.secondaryColor
        self.selectedBackgroundView = selectedBackgroundView
        
    }
    
}
