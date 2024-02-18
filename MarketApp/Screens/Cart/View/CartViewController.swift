//
//  CartViewController.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import UIKit

class CartViewController: UIViewController {
    lazy var viewModel = {
        CartViewModel()
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return tableView
    }()
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Sepetiniz Boş"
        label.textAlignment = .center
        label.isHidden = true
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        initViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initViewModel()
    }
    func initViewModel() {
        viewModel.fetchData()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            self?.infoLabel.isHidden = self?.viewModel.cartCellViewModels.count != 0

        }
    }
    
    func configureUI() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "Cell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        view.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}


extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CartTableViewCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        return cell
    }
    
    
}
