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
    
    @State var showingSort = false
    @State var showingInfo = false
    @State var showingNewComment = false
    
    @ObservedObject var fetch = FetchComments()
    
    var body: some View {
        
        List {
            
            // TOP
            VStack(alignment: .leading) {
                
                // title
                Text(post.title)
                    .font(.headline)
                    .padding(.bottom)
                
                // content
                Text(post.content)
                    .padding(.bottom)
                
                // in/by
                HStack {
                    Text("in").foregroundColor(Color("Grey"))
//                    NavigationLink(destination: GuildView(id: post.guild)) {
//                        Text("+\(post.guild)")
//                    }
                    Button(action: {}) {
                        Text("+\(post.guild)")
                    }.foregroundColor(Color("Purple"))
                    Text("by").foregroundColor(Color("Grey"))
//                    NavigationLink(destination: UserView(id: post.user)) {
//                        Text(post.user)
//                    }
                    Button(action: {}) {
                        Text(post.user)
                    }.foregroundColor(Color("Purple"))
                }
                .font(.system(size: 15))
                
                // context
                HStack {
                    Image(systemName: "arrow.up")
                    Text(String(post.score))
                    Image(systemName: "message")
                    Text(String(post.comments))
                    Image(systemName: "clock")
                    Text(post.createdAt)
                }
                .foregroundColor(Color("Grey"))
                .font(.system(size: 15))
            }
            .padding(.vertical, 8.0)
            .buttonStyle(BorderlessButtonStyle())
            
            // ACTIONS
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
                Button(action: { self.showingNewComment.toggle() }) {
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
            }
            .padding(.vertical)
            .foregroundColor(Color("Purple"))
            .buttonStyle(BorderlessButtonStyle())
            
            // COMMENTS
            if fetch.loading {
                ActivityIndicator(startAnimating: $fetch.loading)
            }
            ForEach(fetch.comments) { comment in
                CommentRow(comment: comment)
            }
        }
        
        .navigationBarTitle("\(fetch.comments.count) Comments")
        
        .navigationBarItems(trailing:
            HStack {
                
                // sort
                Button(action: { self.showingSort = true }) {
                    Image(systemName: "arrow.up.arrow.down")
                }
                
                .actionSheet(isPresented: $showingSort) {
                    ActionSheet(title: Text("Sort By"), buttons: [
                        .default(Text("Top")),
                        .default(Text("Best")),
                        .default(Text("New")),
                        .default(Text("Controversial")),
                        .default(Text("Old")),
                        .cancel()
                    ])
                }
                
                // info
                Button(action: { self.showingInfo = true }) {
                    Image(systemName: "ellipsis")
                }
                .actionSheet(isPresented: $showingInfo) {
                    ActionSheet(title: Text("Info"), buttons: [
                        .default(Text("Upvote")),
                        .default(Text("Downvote")),
                        .default(Text("Reply")),
                        .default(Text(post.user)),
                        .default(Text(post.guild)),
                        .default(Text("Share")),
                        .default(Text("Report")),
                        .cancel()
                    ])
                }
            }
        )
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        return PostView(post: Post(guild: "spacex", user: "charles", score: 0, comments: 0, createdAt: "1d", previewURL: "", title: "The Title", content: "The Content"))
    }
}
