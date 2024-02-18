//
//  ViewController.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    lazy var viewModel = {
        ProductsViewModel()
    }()
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        initViewModel()
        bindViewModel()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func initViewModel() {
        viewModel.getProducts()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    func configureUI() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductCell.self, forCellReuseIdentifier: "Cell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    func bindViewModel() {
        viewModel.badgeNumberDidChange = { [weak self] badgeNumber in
            self?.updateBadgeNumber(number:badgeNumber)
        }
    }
    
    func updateBadgeNumber(number: Int) {
        tabBarController?.tabBar.items?[1].badgeValue = "\(number)"
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        cell.addCartAction = {
            self.viewModel.addCartTapped(at: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = viewModel.itemAtIndex(indexPath.row)
        showDetail(for: selectedItem ,index: indexPath)
    }
    
    func showDetail(for item: ProductCellViewModel ,index : IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.productDetail = item
        detailViewController.viewModel = viewModel
        detailViewController.indexValue = index.row
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
