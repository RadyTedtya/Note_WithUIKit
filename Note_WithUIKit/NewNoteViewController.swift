//
//  NewNoteViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import UIKit

class NewNoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(saveNote))
    }
    
    @objc func saveNote() {
        print("Save note!!")
    }

}
