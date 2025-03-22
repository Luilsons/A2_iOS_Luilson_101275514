//
//  MainViewController.swift
//  A2_IOS_Luilson_101275514
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-03-22.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var products: [Product] = []
    var currentIndex = 0
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let providerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Product Viewer"
        setupUI()
        preloadProductsIfNeeded()
        fetchProducts()
        displayProduct()
    }
    
    func setupUI() {
            let stack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel, priceLabel, providerLabel])
            stack.axis = .vertical
            stack.spacing = 10
            stack.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stack)

            NSLayoutConstraint.activate([
                stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])

        let prevButton = makeButton(title: "Previous", action: #selector(prevProduct))
               let nextButton = makeButton(title: "Next", action: #selector(nextProduct))
               let addButton = makeButton(title: "Add Product", action: #selector(openAddProduct))
               let searchButton = makeButton(title: "Search", action: #selector(searchProduct))
               let viewAllButton = makeButton(title: "View All", action: #selector(openProductList))

               let buttonStack = UIStackView(arrangedSubviews: [prevButton, nextButton, addButton, searchButton, viewAllButton])
               buttonStack.axis = .vertical
               buttonStack.spacing = 10
               buttonStack.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(buttonStack)

               NSLayoutConstraint.activate([
                   buttonStack.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 30),
                   buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
               ])
           }


    func makeButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
