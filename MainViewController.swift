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
