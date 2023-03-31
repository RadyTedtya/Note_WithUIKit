//
//  NewNoteViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    private let _viewModel: ContentViewModel = .init()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var note: Note = .init(id: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        note = Note.dummyImageNote
        title = "Create New Note"
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(createNote))
        setStaticData()
    }
    
    
    @objc func createNote() {
//        _viewModel.createNote()
    }
    
    func setStaticData() {
        titleLabel.text = note.title.capitalized
        dateTimeLabel.text = note.date
        descriptionLabel.text = note.description
    }

}
