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
