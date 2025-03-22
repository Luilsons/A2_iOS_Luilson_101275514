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
    
    func fetchProducts() {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            do {
                products = try context.fetch(fetchRequest)
                tableView.reloadData()
            } catch {
                print("Failed to fetch: \(error.localizedDescription)")
            }
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

