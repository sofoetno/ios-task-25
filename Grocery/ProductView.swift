//
//  ProductView.swift
//  GroceryApp
//
//  Created by Sofo Machurishvili on 09.12.23.
//

import SwiftUI

struct ProductView: View {
    @Binding var product: Product
    
    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 66, height: 66)
                .clipped()
            
            VStack {
                Text(product.name)
                    .font(.callout)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.callout)
                    .foregroundColor(.white)
                
                Text("In stock: \(product.inStock)")
                    .font(.caption)
                
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.29, green: 0.33, blue: 0.41))
            }
            Spacer()
            
            HStack{
                Button {
                    if product.inCart > 0 {
                        product.inCart -= 1
                    }
                } label: {
                    Image("minus")
                }
                
                Rectangle()
                    .frame(width: 26, height: 26)
                    .foregroundColor(.white)
                    .overlay(
                        Text("\(product.inCart)")
                    )
                
                Button {
                    if product.inCart < product.inStock {
                        product.inCart += 1
                    }
                } label: {
                    Image("plus")
                }
            }
            .padding(.trailing, 20)
            
        }
        .padding(.horizontal, 18)
        .background(Color(red: 0.2, green: 0.66, blue: 0.33))
        .cornerRadius(10)
    }
}

#Preview {
    ProductView(
        product: .constant(
            Product(imageName: "fruit1", name: "Blackberry", price: 8.00, inStock: 3)
        )
    )
}
