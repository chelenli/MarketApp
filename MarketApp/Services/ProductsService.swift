//
//  ProductsService.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import Foundation

protocol ProductServiceProtocol {
    func getProducts(completion: @escaping (_ success: Bool, _ results: Products?, _ error: String?) -> ())
}

class ProductsService: ProductServiceProtocol {
    
    func getProducts(completion: @escaping (Bool, Products?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://app.id3.com.tr/sinav.json", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
               
                    let model = try JSONDecoder().decode(Products.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse products to model")
                }
            } else {
                completion(false, nil, "Error: Products GET Request failed")
            }
        }
    }
}
