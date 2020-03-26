//
//  CategoryImage.swift
//  MarketPlace
//
//  Created by Ashish Shrestha on 3/4/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//

import SwiftUI

struct ProductImage: View {
    var picture: String
    
    var body: some View {
        Image(picture)
           .renderingMode(.original)
            .resizable()
           // .frame(width: 200, height: 200, alignment: .center)
            .aspectRatio(contentMode: .fit)
            
    }
}

struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(picture: firebaseSession.products[0].imageName)
    }
}

