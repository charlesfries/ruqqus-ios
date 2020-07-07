//
//  Guild.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct Guild: Identifiable, Codable {
    var id: String = ""
//    var id = UUID()
    var name: String
    var isFavorited: Bool? = false
}

class FetchGuilds: ObservableObject {
    @Published var guilds = [Guild]()
    @Published var loading = false
     
    init() {
        self.loading = true
        
        // TODO:
        let json = """
        [
            { "id": "1", "name": "spacex" },
            { "id": "2", "name": "WatchRedditDie" },
            { "id": "3", "name": "DankMemes" },
            { "id": "4", "name": "Apple" },
            { "id": "5", "name": "Videos" },
            { "id": "6", "name": "News" },
            { "id": "7", "name": "Technology" },
            { "id": "8", "name": "videos" },
            { "id": "9", "name": "Programming" },
            { "id": "10", "name": "Politics" }
        ]
        """
        
        do {
            let decodedData = try JSONDecoder().decode([Guild].self, from: Data(json.utf8))
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // TODO:
                self.guilds = decodedData
                self.loading = false
            }
        } catch {
            print(error)
        }
    }
}
