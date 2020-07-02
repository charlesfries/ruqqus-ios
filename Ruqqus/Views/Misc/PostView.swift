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
    
    @State var showSort = false
    @State var showingNewComment = false
    @State private var isLoading = false
    
    @ObservedObject var fetch = FetchComments()
    
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
                    .foregroundColor(Color("Grey"))
                NavigationLink(destination: GuildView(id: post.guild)) {
                    Text("+\(post.guild)")
                }
                Text("by")
                    .foregroundColor(Color("Grey"))
                NavigationLink(destination: UserView(id: post.user)) {
                    Text(post.user)
                }
            }
            .padding(.horizontal)
            
            // context
            HStack {
                Image(systemName: "arrow.up")
                Text(String(post.score))
                Image(systemName: "message")
                Text(String(post.comments))
                Image(systemName: "clock")
                Text(post.createdAt)
            }
            .padding(.horizontal)
            .foregroundColor(Color("Grey"))
            
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
            if fetch.loading {
                ActivityIndicator(startAnimating: $fetch.loading)
            }
            List(fetch.comments) { comment in
                CommentRow(comment: comment)
            }
        }
        
        .navigationBarItems(trailing:
            HStack {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }

                Button(action: {
                    self.showSort = true
                }) {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
        )
        .navigationBarTitle("\(fetch.comments.count) Comments")
        
        .actionSheet(isPresented: $showSort) {
            ActionSheet(title: Text("Sort"), buttons: [
                .default(Text("Best")),
                .default(Text("Top")),
                .default(Text("Controversial")),
                .cancel()
            ])
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        let post = Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg", title: "Post title #1", content: "Here is the content")
//        return PostView(post: post)
//    }
//}
