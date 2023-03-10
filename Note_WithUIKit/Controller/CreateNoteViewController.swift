//
//  NewNoteViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    private let _viewModel: ContentViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setup() {
        title = "Create New Note"
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(createNote))
        
    }
    
    @objc func createNote() {
        _viewModel.createNote()
    }

}
