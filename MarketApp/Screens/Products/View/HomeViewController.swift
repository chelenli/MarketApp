//
//  ViewController.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 250),
        
        ])
    }
    
    @objc func didTapButton() {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
        
    }


}

