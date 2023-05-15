//
//  ImageNote_TableViewCell.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 17/2/2023.
//

import UIKit

class ImageNoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilePictureImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var cellSubView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = .primaryColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.addSubview(cellSubView)
    }

}
