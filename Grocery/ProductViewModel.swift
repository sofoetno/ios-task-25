//
//  ProductViewModel.swift
//  Grocery
//
//  Created by Sofo Machurishvili on 09.12.23.
//

import SwiftUI

struct Product: Identifiable {
    let id: String = UUID().uuidString
    let imageName: String
    let name: String
    let price: Float
    var inStock: Int
    var inCart: Int = 0
}

class ProductViewModel: ObservableObject {
    @Published var productList: [Product] = []
    @Published var isDiscountApplied: Bool = false
    let discountPercentage = 20
    
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        productList.append(contentsOf: [
            Product(imageName: "fruit1", name: "Blackberry", price: 8.00, inStock: 3),
            Product(imageName: "tomato", name: "Red tomato", price: 2.20, inStock: 8),
            Product(imageName: "carrot", name: "Carrot", price: 1.50, inStock: 11),
            Product(imageName: "yellowTomato", name: "Yello tomato", price: 3.00, inStock: 6),
            Product(imageName: "apple", name: "Apple", price: 2.00, inStock: 15),
            Product(imageName: "banana", name: "Banana", price: 3.00, inStock: 30),
            Product(imageName: "onion", name: "Onion", price: 1.00, inStock: 25),
            Product(imageName: "Cooliflower", name: "Cooliflower", price: 3, inStock: 30)
        ])
    }
    
    func getProduct(id: String) -> Product? {
        productList.first(where: { $0.id == id })
    }
    
    func calculateTotalPrice() -> String {
        var totalPrice = productList.reduce(0) { $0 + $1.price * Float($1.inCart) }
        
        if isDiscountApplied == true {
            totalPrice -= (totalPrice * Float(discountPercentage) / 100)
        }
        return String(format: "%.2f", totalPrice)
    }
    
    func calculateSubtotalPrice() -> String {
        let totalPrice = productList.reduce(0) { $0 + $1.price * Float($1.inCart) }
        
        return String(format: "%.2f", totalPrice)
    }
    
    func calculateQuantity() -> Int {
        productList.reduce(0) { $0 + $1.inCart }
    }
    
    func removeAll() {
        productList = productList.map { product in
            var updateProduct = product
            updateProduct.inCart = 0
            return updateProduct
        }
    }
    
    func displayDiscount() -> Int {
        isDiscountApplied ? discountPercentage : 0
    }
    
    
    
}
