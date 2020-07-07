//
//  UserView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var username: String
    @ObservedObject var fetch = FetchUser()
    
    var body: some View {
        Text(username)
    }
}
