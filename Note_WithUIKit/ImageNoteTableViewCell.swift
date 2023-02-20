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
    @IBOutlet weak var pictureImageView: UIImage?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top:20, left: 20, bottom: 20, right: 20))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ model: Note){
        //    let image = UIImage(named: model.image ?? "photo")
        //    titleLabel.text = model.title
        //    cell.titleLabel.text = note.title
        //    cell.dateLabel.text = note.date
        //    cell.pictureImageView = image
        //    cell.descriptionLabel.text = note.description
    }
    
    func configureCell(cell: ImageNoteTableViewCell, cellIndex: Int) -> UITableViewCell {
        let note: Note = Note.dummyImageNote
        let imageNote = UIImage(named: note.image  ?? "photo")
        cell.titleLabel.text = note.title
        cell.dateLabel.text = note.date
        cell.pictureImageView = imageNote
        cell.descriptionLabel.text = note.description
        return cell
    }
    
}
