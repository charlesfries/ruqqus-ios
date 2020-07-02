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
            
            List {
                HStack {
                    VStack {
                        Text("7.3k").font(.title)
                        Text("Rep")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    Spacer()
                    VStack {
                        Text("57").font(.title)
                        Text("Subscribers")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    Spacer()
                    VStack {
                        Text("11m 25d").font(.title)
                        Text("Account Age")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                }.padding()
                
                Section {
                    NavigationLink(destination: FeedView(feed: Feed(name: "All"))) {
                        Text("Posts")
                    }
                    NavigationLink(destination: FeedView(feed: Feed(name: "All"))) {
                        Text("Comments")
                    }
                }
                
            }
            
            .listStyle(GroupedListStyle())
            .navigationBarTitle("captainmeta4", displayMode: .inline)
        }
    }
}
