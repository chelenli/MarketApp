//
//  ProductService.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//
import Foundation
typealias Products = [Product]

struct Product: Codable {
    let id: Int
    let model: String
    let description: String
    let colors: [String]
    let screenDimension: Double
    let batteryCapacity: Int
    let price: Int
    enum CodingKeys: String, CodingKey {
            case id
            case model
            case description = "açıklama"
            case colors = "renkler"
            case screenDimension = "ekran_boyutu_inch"
            case batteryCapacity = "pil_kapasitesi_mAh"
            case price = "fiyat_usd"
        }
}
