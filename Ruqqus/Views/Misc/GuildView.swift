//
//  GuildView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct GuildView: View {
    var id: String
    
    @ObservedObject var fetch = FetchPosts()
    
    var body: some View {
        VStack {
            if fetch.loading {
                ProgressView()
            }
            List(fetch.posts) { post in
                GuildPostRow(post: post)
            }
        }
        .navigationBarTitle(id)
    }
}

class FetchPosts: ObservableObject {
    @Published var posts = [Post]()
    @Published var loading = false
     
    init() {
        self.loading = true
        
        // TODO:
        let json = """
        [
            { "id": "1", "guild": "spacex", "user": "charles", "score": 0, "comments": 0, "createdAt": "1d", "previewURL": "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg", "title": "Post title #3", "content": "Here is the content" },
            { "id": "2", "guild": "spacex", "user": "charles", "score": 0, "comments": 0, "createdAt": "1d", "previewURL": "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg", "title": "Post title #3", "content": "Here is the content" },
            { "id": "3", "guild": "spacex", "user": "charles", "score": 0, "comments": 0, "createdAt": "1d", "previewURL": "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg", "title": "Post title #3", "content": "Here is the content" }
        ]
        """
        
        do {
            let decodedData = try JSONDecoder().decode([Post].self, from: Data(json.utf8))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // TODO:
                self.posts = decodedData
                self.loading = false
            }
        } catch {
            print(error)
        }
    }
}
