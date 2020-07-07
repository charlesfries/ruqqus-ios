//
//  PostRow.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct PostRow: View {
    var post: Post
    var isFeed: Bool
    
    @State private var toGuildAction: Int? = 0
    @State private var toUserAction: Int? = 0

    var body: some View {
        NavigationLink(destination: PostView(post: post)) {
            HStack(alignment: .top) {
                Image("PostPreview")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(post.title)
                    HStack {
                        if isFeed {
                            Button(action: { self.toGuildAction = 1 }) {
                                Text("+\(post.guild)")
                                    .foregroundColor(Color("Purple"))
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: GuildView(name: post.guild), tag: 1, selection: $toGuildAction) {}
                        } else {
                            Button(action: { self.toUserAction = 1 }) {
                                Text(post.user)
                                    .foregroundColor(Color("Purple"))
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: UserView(username: post.user), tag: 2, selection: $toUserAction) {}
                        }
                        Image(systemName: "arrow.up")
                        Text(String(post.score))
                        Image(systemName: "message")
                        Text(String(post.comments))
                        Image(systemName: "clock")
                        Text(post.createdAt)
                        Image(systemName: "ellipsis")
                    }
                    .foregroundColor(Color("Grey"))
                    .padding(0)
                    .font(.system(size: 15))
                }
            }
        }.padding(.vertical, 5)
    }
}



struct RowViews_Previews: PreviewProvider {
    static var previews: some View {
        PostRow(post: Post(guild: "spacex", user: "charles", score: 0, comments: 0, createdAt: "1d", previewURL: "", title: "The Title", content: "The Content"), isFeed: true)
    }
}
