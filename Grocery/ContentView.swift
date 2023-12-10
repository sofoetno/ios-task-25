//
//  ContentView.swift
//  GroceryApp
//
//  Created by Sofo Machurishvili on 09.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var productViewModel = ProductViewModel()
    
    var body: some View {
        
        ScrollView{
            
            VStack {
                
                CartView(productViewModel: productViewModel)
                
                HStack {
                    Button {
                        productViewModel.removeAll()
                    } label: {
                        Text("Remove all")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(red: 1, green: 0.8, blue: 0.25))
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Spacer()
                    
                    Toggle(isOn: $productViewModel.isDiscountApplied) {
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                }
                
                .padding()
                
                
                ForEach($productViewModel.productList, id: \.id) { product in
                    ProductView(product: product)
                        .padding(.horizontal, 16)
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "arrow.right")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 18)
                        .background(Color(red: 1, green: 0.8, blue: 0.25))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .fontWeight(.bold)
                        .font(.title)
                    
                }
            }
        }
        
    }
    
    
    
}

#Preview {
    ContentView()
}
