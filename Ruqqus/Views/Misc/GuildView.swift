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
        VStack { // TODO: needed for ProgressView
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
