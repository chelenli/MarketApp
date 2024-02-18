//
//  CartObjectsViewModel.swift
//  MarketApp
//
//  Created by Naciye Celenli on 17.02.2024.
//

import UIKit
import CoreData

class CartViewModel: NSObject {
    
    var reloadTableView: (() -> Void)?
    var products = Products()
    
    var cartCellViewModels = [CartCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func fetchData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
        fetchRequest.returnsObjectsAsFaults = false
        
        var vms = [CartCellViewModel]()
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [ProductEntity] {
                vms.append(createCellModel(product: result))
            }
            
        } catch {
            print("error")
        }
        cartCellViewModels = vms
    }
        
    func createCellModel(product: ProductEntity) -> CartCellViewModel {

        return CartCellViewModel(id: product.id, model: product.title ?? "", price: product.price , quantity:product.quantity)

    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CartCellViewModel {
        return cartCellViewModels[indexPath.row]
    }
}
