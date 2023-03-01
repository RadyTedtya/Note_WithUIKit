//
//  User.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 26/2/2023.
//

import Foundation

struct User {
    let id: Int!
    let username: String!
    let password: String!
    let email: String!
    
    static let dummyUser = User.init(id: 1, username: "test", password: "test123", email: "test@gmail.com")
    
}
