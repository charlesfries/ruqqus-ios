//
//  Post.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var guild: Guild
    var user: User
    var score: Int
    var comments: Int
    var createdAt: String
    var previewURL: String
    var title: String
    var content: String
}
