//
//  SearchView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct SearchView: View {
//    @Binding var searchText: String
    
    var body: some View {
        NavigationView {
            Text("Search")
//            TextField($searchText) {
//                UIApplication.shared.keyWindow?.endEditing(true)
//            }
            .navigationBarTitle("Search", displayMode: .inline)
        }
    }
}
