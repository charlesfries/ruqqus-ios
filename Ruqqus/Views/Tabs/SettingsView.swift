//
//  SettingsView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Text("General")
                Text("Appearance")
                Text("Notifications")
                Text("Theme")
                Text("Face ID & Passcode")
                Text("Filters & Blocks")
            }.listStyle(GroupedListStyle())
            
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}
