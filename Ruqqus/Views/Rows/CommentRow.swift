//
//  CommentRow.swift
//  Ruqqus
//
//  Created by Charles Fries on 7/6/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct CommentRow: View {
    var comment: Comment
    var isMini: Bool = false
    @State private var action: Int? = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: { self.action = 1 }) {
                    Text(comment.user).foregroundColor(Color("Purple"))
                }
                
                Image(systemName: "arrow.up").foregroundColor(Color("Grey"))
                Text(String(comment.score)).foregroundColor(Color("Grey"))
                Spacer()
                Text(comment.createdAt).foregroundColor(Color("Grey"))
            }
            if !isMini {
                Text(comment.content)
            }
            
            NavigationLink(destination: UserView(username: comment.user), tag: 1, selection: $action) {
                EmptyView()
            }
        }
        .font(.system(size: 15))
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(comment: Comment(post: "123", user: "charles", createdAt: "1d", score: 0, content: "Hello, world!"))
    }
}
