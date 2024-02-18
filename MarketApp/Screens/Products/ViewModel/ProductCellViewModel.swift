//
//  ProductCellViewModel.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import Foundation

struct ProductCellViewModel: Codable {
    var id: Int
    var model: String
    var description: String
    var colors: [String]
    var screenDimension: Double
    var batteryCapacity: Int
    var price: Int
    
}
