//
//  CategoryRow.swift
//  MarketPlace
//
//  Created by Ashish Shrestha on 3/17/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//
import SwiftUI

struct CategoryRow: View {
    var items: [Category]
    var categoryName="Sample"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: -5) {
                ForEach(items, id: \.self.id) { category in
                    VStack{
                        CategoryImage(picture: category.name)
                        Text(category.name)
                            .foregroundColor(.primary)
                            .font(.caption)
                    }.padding()
                }
            }.frame(height: 100)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            items: Array(firebaseSession.categories.prefix(5))
        )
    }
}
