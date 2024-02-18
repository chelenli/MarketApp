//
//  ProductsViewModel.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import Foundation
import CoreData
import UIKit

class ProductsViewModel: NSObject {
    private var productsService: ProductServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var products = Products()
    
    var productCellViewModels = [ProductCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    func itemAtIndex(_ index: Int) -> ProductCellViewModel {
        
        return productCellViewModels[index]
    }
    var badgeNumber: Int = 0 {
        didSet {
            badgeNumberDidChange?(badgeNumber)
        }
    }
    
    var badgeNumberDidChange: ((Int) -> Void)?
    
    func updateBadgeNumber(newNumber: Int) {
        badgeNumber = newNumber
    }
    
    func fetchData(products: Products) {
        self.products = products
        var vms = [ProductCellViewModel]()
        for product in products {
            vms.append(createCellModel(product: product))
        }
        productCellViewModels = vms
    }
    
    init(productsService: ProductServiceProtocol = ProductsService()) {
        self.productsService = productsService
        
    }
    func addCartTapped(at indexPath: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", productCellViewModels[indexPath].id)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let firstResult = results.first {
                firstResult.quantity += 1
            } else {
                let saveData = NSEntityDescription.insertNewObject(forEntityName: "ProductEntity", into: context)
                saveData.setValue(productCellViewModels[indexPath].price, forKey: "price")
                saveData.setValue(productCellViewModels[indexPath].model, forKey: "title")
                saveData.setValue(productCellViewModels[indexPath].id, forKey: "id")
                saveData.setValue(1, forKey: "quantity")
            }
            
        } catch {
            print("Core Data'ya veri kaydedilirken hata oluştu: \(error)")
        }
        
        
        do {
            try context.save()
            print("Success")
        }
        catch {
            print("Error")
        }
        
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
            let count = try context.count(for: fetchRequest)
            print("Counted \(count) objects")
            badgeNumber = count
        }
        catch {
            print("Error")
        }
        
    }
    func getProducts() {
        productsService.getProducts{ success, model, error in
            if success, let products = model {
                self.fetchData(products: products )
            } else {
                print(error!)
            }
        }
    }
    
    func createCellModel(product: Product) -> ProductCellViewModel {
        let id = product.id
        let model = product.model
        let desc = product.description
        let colors = product.colors
        let screenDim = product.screenDimension
        let batteryCap = product.batteryCapacity
        let price = product.price
        
        return ProductCellViewModel(id: id, model: model, description: desc, colors: colors, screenDimension: screenDim, batteryCapacity: batteryCap, price: price)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> ProductCellViewModel {
        return productCellViewModels[indexPath.row]
    }
}
