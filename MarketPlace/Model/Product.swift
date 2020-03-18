//
//  Product.swift
//  MarketPlace
//
//  Created by Ashish Shrestha on 3/4/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//


import CoreLocation

struct Product: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var price: Double
    var email: String
    var category: String
    var condition: String
    var imageName: String
    var latitude: Double
    var longitude: Double
    var description: String
    var isFavorite: Bool
}
