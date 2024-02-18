//
//  DetailViewController.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var productDetail: ProductCellViewModel?
    var indexValue: Int?
    var addCartAction: (() -> Void)?
    
    lazy var viewModel = {
          ProductsViewModel()
    }()
    
    let titleLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)

        return label
    }()
        
    let descriptionText: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var imageArea = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: #selector(addCartClicked), for: .touchUpInside)
    
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let item = productDetail {
            titleLabel.text = item.model
            descriptionText.text = item.description
        }
    }
    
    func setupUI() {
        
        view.backgroundColor = .white
        view.addSubview(imageArea)
        view.addSubview(titleLabel)
        view.addSubview(descriptionText)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
  
            imageArea.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageArea.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageArea.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageArea.heightAnchor.constraint(equalToConstant: 150),
            

            titleLabel.topAnchor.constraint(equalTo: imageArea.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            

            descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            descriptionText.heightAnchor.constraint(equalToConstant: 150),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
    }
    @objc func addCartClicked() {
        
        viewModel.addCartTapped(at: indexValue ?? 0)
        
    }
}

