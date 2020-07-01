//
//  Comment.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct Comment: Identifiable, Codable {
    var id: String = ""
    var post: String // Post
    var user: String // User
    var createdAt: String
    var score: Int
    var content: String
}
