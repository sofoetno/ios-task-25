//
//  CartView.swift
//  Grocery
//
//  Created by Sofo Machurishvili on 09.12.23.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var productViewModel: ProductViewModel
    
    
    var body: some View {
        HStack {
            Image(systemName: "cart")
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
            
            Text("Sopping cart (\(productViewModel.calculateQuantity()))")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.title3)
            Spacer()
            
            VStack(alignment: .trailing) {

                Text("Subtotal: $\(productViewModel.calculateSubtotalPrice())")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .font(.callout)
                
                Text("Discount: \(productViewModel.displayDiscount())%")
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.medium)
                
                Text("Total: $\(productViewModel.calculateTotalPrice())")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .font(.callout)
            }

            
        }
        
        .cornerRadius(8.0)
        .padding()
        .background(Color(red: 0.2, green: 0.66, blue: 0.33))
    }
    
}

#Preview {
    CartView( productViewModel: ProductViewModel())
}
