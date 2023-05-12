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
        for item in NoteType.allCases {
            if item != .allNotes {
                noteTypeSegment.insertSegment(withTitle: item.rawValue, at: noteTypeSegment.numberOfSegments, animated: false)
            }
        }
        noteTypeSegment.selectedSegmentIndex = 0
        dateLabel.text = "\(fetchCurrentDateTime())"
          
    }
    
    func fetchCurrentDateTime() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let dateString = df.string(from: date)
        return dateString
    }
    
    @objc func dismissView() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.modalPresentationStyle = .fullScreen
        homeViewController.navigationBar.backgroundColor = .primaryBackgroundColor
        self.present(homeViewController, animated: true)
    }
    
    
    @objc func createNote() {
        var selectedNoteType: NoteType {
            switch noteTypeSegment.selectedSegmentIndex {
            case 0:
                return .audioNote
            case 1:
                return .reminderNote
            case 2:
                return .imageNote
            default:
                return .audioNote
            }
        }
        let uid = NoteApp.shared.uid
        let note: Note = .init(id: 0, title: titleTextField.text, date: dateLabel.text, noteType: selectedNoteType, audio: nil, image: "image", description: descriptionTextView.text, uid: uid)
        _viewModel.writeToFirebase(note: note)
    }
    
}

