//
//  AudioNote_TableViewCell.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 18/2/2023.
//

import UIKit

class AudioNoteTableViewCell: UITableViewCell {

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top:10, left: 20, bottom: 10, right: 20))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
}
