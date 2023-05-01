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

    @IBOutlet var noteTypeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup() 
    }

    func setup() {

        title = "Create New Note"
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(createNote))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self , action: #selector(dismissView))
        noteTypeSegment.removeAllSegments()
        for item in NoteType.noteTypes {
            noteTypeSegment.insertSegment(withTitle: item, at: noteTypeSegment.numberOfSegments, animated: false)
        }
        
    }
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func createNote() {
        let note: Note = .init(id: 0, title: titleTextField.text, date: dateLabel.text, noteType: .imageNote, audio: nil, image: "image", description: descriptionTextView.text)
        _viewModel.writeToFirebase(note: note)
    }
    
}

