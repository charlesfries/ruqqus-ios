//
//  User.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Codable {
    // var id = UUID()
    var id: String = ""
    var username: String
}

class FetchUser: ObservableObject {
    @Published var user = User(username: "what")
    @Published var loading = false
     
    init() {
        self.loading = true
        
        // TODO:
        let json = """
        { "id": "1", "username": "charles" }
        """
        
        do {
            let decodedData = try JSONDecoder().decode(User.self, from: Data(json.utf8))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // TODO:
                self.user = decodedData
                self.loading = false
            }
        } catch {
            print(error)
        }
    }
}
