//
//  ProductListViewController.swift
//  A2_IOS_Luilson_101275514
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-03-22.
//

import UIKit
import CoreData

class ProductListViewController: UITableViewController {
    
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Products"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchProducts()
    }
