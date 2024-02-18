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
        
    
    lazy var imageArea = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
//    lazy var button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Add to Cart", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .blue
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        button.addTarget(self, action: #selector(addCartClicked), for: .touchUpInside)
//
//        return button
//    }()
    
    func commonInit() {
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(priceLabel)
        
        stackView.addArrangedSubview(innerStackView)
        NSLayoutConstraint.activate([
            innerStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
            innerStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
            innerStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
            innerStackView.widthAnchor.constraint(equalToConstant: 100)
        ])
        stackView.addArrangedSubview(imageArea)
        
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
        ])
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

