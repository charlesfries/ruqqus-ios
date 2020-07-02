//
//  AccountView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            Text("Account")
            .navigationBarTitle("Account", displayMode: .inline)
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Hone")
            .navigationBarTitle("Account", displayMode: .inline)
        }
    }
}

struct NewsView: View {
    var body: some View {
        NavigationView {
            Text("News")
            .navigationBarTitle("Account", displayMode: .inline)
        }
    }
}

struct TrendingView: View {
    var body: some View {
        NavigationView {
            Text("Trending")
            .navigationBarTitle("Account", displayMode: .inline)
        }
    }
}

struct Explore: View {
    var body: some View {
        NavigationView {
            Text("Explore")
            .navigationBarTitle("Account", displayMode: .inline)
        }
    }
}
