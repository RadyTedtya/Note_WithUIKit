//
//  NewNoteViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    var _viewModel: ContentViewModel = .init()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @objc func createNote() {
        let note: Note = .init(id: 0, title: titleTextField.text, date: dateLabel.text, noteType: .imageNote, audio: nil, image: "image", description: descriptionTextView.text)
        _viewModel.writeToFirebase(note: note)
    }

    func setup() {

        title = "Create New Note"
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(createNote))
        navigationItem.leftBarButtonItem = .init(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(self.dismissView))
        
        
    }
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    func populateStaticData() {
        titleTextField.text = "Spring Vacation"
        dateLabel.text = "28 Dec 2017, 04:52PM"
        descriptionTextView.text = Note.description
    }
    
}

