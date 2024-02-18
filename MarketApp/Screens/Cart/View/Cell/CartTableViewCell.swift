//
//  CartTableViewCell.swift
//  MarketApp
//
//  Created by Naciye Celenli on 17.02.2024.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    private lazy var stackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var innerStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel = {
        let label = UILabel()
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var quantityLabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageArea = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return view
    }()
    
    func configureInnerStack() {
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(priceLabel)
        
        stackView.addArrangedSubview(innerStackView)
        
        NSLayoutConstraint.activate([
            innerStackView.topAnchor.constraint(equalTo: stackView.layoutMarginsGuide.topAnchor, constant: 0.0),
            innerStackView.bottomAnchor.constraint(equalTo: stackView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
            innerStackView.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
            innerStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func commonInit() {

        stackView.addArrangedSubview(imageArea)
        imageArea.addSubview(quantityLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            quantityLabel.centerYAnchor.constraint(equalTo:imageArea.centerYAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureInnerStack()
        commonInit()
        
    }
    
    var cellViewModel: CartCellViewModel? {
        didSet {
            titleLabel.text = cellViewModel?.model
            priceLabel.text = "\(cellViewModel?.price ?? 0)" + "$"
            quantityLabel.text = "\(cellViewModel?.quantity ?? 0)"
            
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

