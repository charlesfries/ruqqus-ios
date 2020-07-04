//
//  ContentView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GuildsView().tabItem {
                Image(systemName: "flame")
                Text("Guilds")
            }
            AccountView().tabItem {
                Image(systemName: "person")
                Text("Account")
            }
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            SettingsView().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }.accentColor(Color("Purple"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
