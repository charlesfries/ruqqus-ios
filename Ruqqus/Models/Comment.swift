//
//  Comment.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct Comment: Identifiable {
    var id = UUID()
    var post: Post
    var user: User
    var createdAt: String
    var score: Int
    var content: String
}
