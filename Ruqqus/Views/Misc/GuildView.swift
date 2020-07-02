//
//  GuildView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct GuildView: View {
    var guild: String
    
    @ObservedObject var fetch = FetchPosts()
    
    var body: some View {
        VStack {
            if fetch.loading {
                ActivityIndicator(startAnimating: $fetch.loading)
            }
            
            List(fetch.posts) { post in
                GuildPostRow(post: post)
            }
        }
        .navigationBarTitle(guild)
    }
}
