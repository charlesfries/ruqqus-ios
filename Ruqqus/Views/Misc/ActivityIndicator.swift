//
//  ActivityIndicator.swift
//  Ruqqus
//
//  Created by Chris Larsen on 7/1/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var startAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.startAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
