//
//  MainViewController.swift
//  A2_IOS_Luilson_101275514
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-03-22.
//

import UIKit
import CoreData

typealias ProductEntity = A2_IOS_Luilson_101275514.Product

class MainViewController: UIViewController {
    
    var products: [ProductEntity] = []
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


    func fetchProducts() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ProductEntity> = Product.fetchRequest()
        products = (try? context.fetch(fetchRequest)) ?? []
    }

    func displayProduct() {
        guard !products.isEmpty else { return }
        let p = products[currentIndex]
        nameLabel.text = "Name: \(p.name ?? "")"
        descriptionLabel.text = "Description: \(p.productDescription ?? "")"
        priceLabel.text = "Price: $\(p.price)"
        providerLabel.text = "Provider: \(p.provider ?? "")"
    }

    @objc func nextProduct() {
           if currentIndex < products.count - 1 {
               currentIndex += 1
               displayProduct()
           }
       }

       @objc func prevProduct() {
           if currentIndex > 0 {
               currentIndex -= 1
               displayProduct()
           }
       }


    @objc func openAddProduct() {
        let addVC = AddProductViewController()
        navigationController?.pushViewController(addVC, animated: true)
    }

    @objc func searchProduct() {
           let alert = UIAlertController(title: "Search", message: "Enter product name", preferredStyle: .alert)
           alert.addTextField()
           alert.addAction(UIAlertAction(title: "Search", style: .default) { _ in
               guard let term = alert.textFields?.first?.text else { return }
               let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
               let fetch: NSFetchRequest<ProductEntity> = Product.fetchRequest()
               fetch.predicate = NSPredicate(format: "name CONTAINS[cd] %@", term)
               self.products = (try? context.fetch(fetch)) ?? []
               self.currentIndex = 0
               self.displayProduct()
           })
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
           present(alert, animated: true)
       }


    @objc func openProductList() {
        let listVC = ProductListViewController()
        navigationController?.pushViewController(listVC, animated: true)
    }


    func preloadProductsIfNeeded() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<ProductEntity> = Product.fetchRequest()
        let count = (try? context.count(for: request)) ?? 0
        if count == 0 {
            for i in 1...10 {
                let p = ProductEntity(context: context)
                p.productID = Int64(i)
                p.name = "Product \(i)"
                p.productDescription = "Description for product \(i)"
                p.price = Double(i * 10)
                p.provider = "Provider \(i)"
            }
            try? context.save()
        }
    }
}
 = A2_IOS_Luilson_101275514.Product

class MainViewController: UIViewController {
    
    var products: [ProductEntity] = []
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


    func fetchProducts() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ProductEntity> = Product.fetchRequest()
        products = (try? context.fetch(fetchRequest)) ?? []
    }

    func displayProduct() {
        guard !products.isEmpty else { return }
        let p = products[currentIndex]
        nameLabel.text = "Name: \(p.name ?? "")"
        descriptionLabel.text = "Description: \(p.productDescription ?? "")"
        priceLabel.text = "Price: $\(p.price)"
        providerLabel.text = "Provider: \(p.provider ?? "")"
    }

    @objc func nextProduct() {
           if currentIndex < products.count - 1 {
               currentIndex += 1
               displayProduct()
           }
       }

       @objc func prevProduct() {
           if currentIndex > 0 {
               currentIndex -= 1
               displayProduct()
           }
       }


    @objc func openAddProduct() {
        let addVC = AddProductViewController()
        navigationController?.pushViewController(addVC, animated: true)
    }

    @objc func searchProduct() {
           let alert = UIAlertController(title: "Search", message: "Enter product name", preferredStyle: .alert)
           alert.addTextField()
           alert.addAction(UIAlertAction(title: "Search", style: .default) { _ in
               guard let term = alert.textFields?.first?.text else { return }
               let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
               let fetch: NSFetchRequest<ProductEntity> = Product.fetchRequest()
               fetch.predicate = NSPredicate(format: "name CONTAINS[cd] %@", term)
               self.products = (try? context.fetch(fetch)) ?? []
               self.currentIndex = 0
               self.displayProduct()
           })
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
           present(alert, animated: true)
       }


    @objc func openProductList() {
        let listVC = ProductListViewController()
        navigationController?.pushViewController(listVC, animated: true)
    }


    func preloadProductsIfNeeded() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<ProductEntity> = Product.fetchRequest()
        let count = (try? context.count(for: request)) ??
        if count == 0 {
            for i in 1...10 {
                let p = ProductEntity(context: context)
                p.productID = Int64(i)
                p.name = "Product \(i)"
                p.productDescription = "Description for product \(i)"
                p.price = Double(i * 10)
                p.provider = "Provider \(i)"
            }
            try? context.save()
        }
    }
}
