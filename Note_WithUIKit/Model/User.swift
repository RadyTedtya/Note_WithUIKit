//
//  User.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 26/2/2023.
//

import Foundation

struct User {
    var id: Int!
    var username: String! = ""
    var password: String! = ""
    var email: String!
    
    static let initUser = User.init(id: 0, username: "", password: "", email: "")
    static let dummyUser = User.init(id: 1, username: "test", password: "test123", email: "test@gmail.com")
    
}
