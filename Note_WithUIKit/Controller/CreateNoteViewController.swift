//
//  NewNoteViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    private var _viewModel: ContentViewModel!

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var note: Note = .init(id: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        populateStaticData()
    }

    @objc func createNote() {
        _viewModel.createNote()
    }

    func setup() {
        note = Note.dummyImageNote
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
