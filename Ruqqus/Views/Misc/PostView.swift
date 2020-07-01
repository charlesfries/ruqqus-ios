//
//  PostView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    @State var showingNewComment = false
    
    @ObservedObject var fetch = FetchComments()
    
//    let comments: [Comment] = [
//        Comment(post: Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #1", content: "Here is the content"), user: User(username: "charles"), createdAt: "1d", score: 3, content: "Test comment #1"),
//        Comment(post: Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #1", content: "Here is the content"), user: User(username: "charles"), createdAt: "1d", score: 3, content: "Test comment #2"),
//        Comment(post: Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #1", content: "Here is the content"), user: User(username: "charles"), createdAt: "1d", score: 3, content: "Test comment #3")
//    ]
    
    var body: some View {
        
        
        
        VStack(alignment: .leading) {
            
            // title
            Text(post.title)
                .padding(.horizontal)
                .font(.title)
            
            // content
            Text(post.content)
                .padding(.horizontal)
            
            // in/by
            HStack {
                Text("in")
                NavigationLink(destination: GuildView(id: post.guild)) {
                    Text(post.guild)
                }
                Text("by")
                NavigationLink(destination: UserView(id: post.user)) {
                    Text(post.user)
                }
            }.padding(.horizontal)
            
            // context
            HStack {
                Image(systemName: "arrow.up")
                Text(String(post.score))
                Image(systemName: "message")
                Text(String(post.comments))
                Image(systemName: "clock")
                Text(post.createdAt)
            }.padding(.horizontal)
            
            Divider()
            
            // actions
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.up")
                        .font(.title)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "arrow.down")
                        .font(.title)
                }
                Spacer()
                Button(action: {
                    self.showingNewComment.toggle()
                }) {
                    Image(systemName: "arrowshape.turn.up.left")
                        .font(.title)
                }.sheet(isPresented: $showingNewComment) {
                    NewCommentView()
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                }
            }.padding()
            
            Divider()
            
            // comments
            List(fetch.comments) { comment in
                CommentRow(comment: comment)
            }
        }
        
        .navigationBarItems(trailing:
            HStack {
                Button(action: {}) {
                    Image("ellipsis")
                }

                Button("Sort") {
                    
                }
            }
        )
    }
}

class FetchComments: ObservableObject {
    @Published var comments = [Comment]()
    @Published var loading = false
     
    init() {
        self.loading = true
        
        // TODO:
        let json = """
        [
            { "id": "1", "post": "xyz", "user": "charles", "createdAt": "1d", "score": 3, "content": "Test comment #1" },
            { "id": "2", "post": "xyz", "user": "charles", "createdAt": "1d", "score": 3, "content": "Test comment #2" },
            { "id": "3", "post": "xyz", "user": "charles", "createdAt": "1d", "score": 3, "content": "Test comment #3" },
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

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        let post = Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg", title: "Post title #1", content: "Here is the content")
//        return PostView(post: post)
//    }
//}
