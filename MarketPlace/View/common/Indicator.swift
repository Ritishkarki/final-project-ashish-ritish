//
//  Indicator.swift
//  MarketPlace
//
//  Created by ritish karki on 4/15/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//
import SwiftUI
struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
        
    }
}
