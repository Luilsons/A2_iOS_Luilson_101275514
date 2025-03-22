//
//  AddProductViewController.swift
//  A2_IOS_Luilson_101275514
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-03-22.
//

import UIKit
import CoreData

class AddProductViewController: UIViewController {
    
    let nameField = UITextField()
    let descriptionField = UITextField()
    let priceField = UITextField()
    let providerField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add Product"
        setupForm()
    }
