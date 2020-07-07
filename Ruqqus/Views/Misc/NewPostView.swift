//
//  NewPostView.swift
//  Ruqqus
//
//  Created by Charles Fries on 7/4/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct NewPostView: View {
    var body: some View {
        NavigationView {
            Text("New Post")
            .navigationBarTitle("Submit Post", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {}) { Text("Cancel") },
                trailing: Button(action: {}) { Text("Post") }
            )
        }
        .accentColor(Color("Purple"))
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
