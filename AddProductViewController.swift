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
    
    func setupForm() {
        nameField.placeholder = "Product Name"
        descriptionField.placeholder = "Description"
        priceField.placeholder = "Price"
        priceField.keyboardType = .decimalPad
        providerField.placeholder = "Provider"
        
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(self, action: #selector(saveProduct), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [nameField, descriptionField, priceField, providerField, saveButton])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        [nameField, descriptionField, priceField, providerField].forEach { field in
            field.borderStyle = .roundedRect
        }
    }
    
    @objc func saveProduct() {
           let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
           let product = Product(context: context)
           product.productID = Int64(Date().timeIntervalSince1970)
           product.name = nameField.text
           product.productDescription = descriptionField.text
           product.price = Double(priceField.text ?? "") ?? 0.0
           product.provider = providerField.text

           do {
               try context.save()
               navigationController?.popViewController(animated: true)
           } catch {
               print("Failed to save: \(error.localizedDescription)")
           }
       }
   }
