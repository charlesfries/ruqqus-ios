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
                NavigationLink(destination: SettingsGeneralView()) {
                    Text("General")
                }
                NavigationLink(destination: SettingsAppearanceView()) {
                    Text("Appearance")
                }
                NavigationLink(destination: SettingsNotificationsView()) {
                    Text("Notifications")
                }
                NavigationLink(destination: Text("Theme")) {
                    Text("Theme")
                }
                NavigationLink(destination: Text("Face ID & Passcode")) {
                    Text("Face ID & Passcode")
                }
                NavigationLink(destination: Text("Filters & Blocks")) {
                    Text("Filters & Blocks")
                }
            }.listStyle(GroupedListStyle())
            
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

struct SettingsGeneralView: View {
    var body: some View {
        Text("General")
        .navigationBarTitle("General", displayMode: .inline)
    }
}

struct SettingsAppearanceView: View {
    var body: some View {
        Text("Appearance")
        .navigationBarTitle("Appearance", displayMode: .inline)
    }
}

struct SettingsNotificationsView: View {
    var body: some View {
        Text("Notifications")
        .navigationBarTitle("Notifications", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
