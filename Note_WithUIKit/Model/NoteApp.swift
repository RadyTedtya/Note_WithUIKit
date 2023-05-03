//
//  ShareResult.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 4/3/2023.
//

import Foundation
import UIKit

class NoteApp {
    
    var isLogin: Bool = false
    
    var selectedType: NoteType = .allNotes
    
    static let shared = NoteApp()
    
    func nextViewController(currentVC: ViewController, nextVC: ViewController) {
        let nextVC = UINavigationController(rootViewController: nextVC)
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.navigationBar.backgroundColor = .primaryBackgroundColor
        currentVC.present(nextVC, animated: true)
//        self.present(nextVC, animated: true)
    }
    
    private init() {
         
    }
    
}
