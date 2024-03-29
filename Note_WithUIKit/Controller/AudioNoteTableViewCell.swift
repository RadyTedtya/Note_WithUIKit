//
//  AudioNote_TableViewCell.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 18/2/2023.
//

import UIKit

class AudioNoteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = .primaryBackgroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
}
