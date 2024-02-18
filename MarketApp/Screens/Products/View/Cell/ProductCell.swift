
//
//  ProductCell.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import UIKit
import CoreData

class ProductCell: UITableViewCell {
  
    var addCartAction: (() -> Void)?
    
    private lazy var stackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var imageArea = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()
        
    lazy var priceLabel = {
        let label = UILabel()
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var titleLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(addCartClicked), for: .touchUpInside)
    
        return button
    }()
    
    func commonInit() {
        stackView.addArrangedSubview(imageArea)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(button)
        
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
        ])
    }

    
    @objc func addCartClicked() {
        
        addCartAction?()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()

    }
    
    var cellViewModel: ProductCellViewModel? {
            didSet {
                titleLabel.text = cellViewModel?.model
                priceLabel.text = "\(cellViewModel?.price ?? 0)" + "$"
               
            }
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

