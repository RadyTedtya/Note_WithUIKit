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
    
    var uid: String = ""
    
    static let shared = NoteApp()
    
    private init() {
         
    }
    
}
