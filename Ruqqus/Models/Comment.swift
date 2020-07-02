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

class FetchComments: ObservableObject {
    @Published var comments = [Comment]()
    @Published var loading = false
     
    init() {
        self.loading = true
        
        // TODO:
        let json = """
        [
            { "id": "1", "post": "1", "user": "captainmeta4", "createdAt": "1d", "score": 3, "content": "Test comment #1" },
            { "id": "2", "post": "1", "user": "captainmeta4", "createdAt": "1d", "score": 3, "content": "Test comment #2" },
            { "id": "3", "post": "1", "user": "captainmeta4", "createdAt": "1d", "score": 3, "content": "Test comment #3" }
        ]
        """
        
        do {
            let decodedData = try JSONDecoder().decode([Comment].self, from: Data(json.utf8))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // TODO:
                self.comments = decodedData
                self.loading = false
            }
        } catch {
            print(error)
        }
    }
}
