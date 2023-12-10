//
//  Toggler.swift
//  Grocery
//
//  Created by Sofo Machurishvili on 09.12.23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            withAnimation {
                configuration.isOn.toggle()
            }
        }, label: {
            VStack {
                Text("Discount 20%")
                    .foregroundColor(Color(red: 1, green: 0.8, blue: 0.25))
                    .fontWeight(.bold)
                
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 80, height: 34)
                    .foregroundColor(configuration.isOn ? .green : .red)
                    .overlay(
                        HStack {
                            if !configuration.isOn {
                                Image("sad")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            Text(configuration.isOn ? "On" : "Off")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            if configuration.isOn {
                                Image("smile")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    )
                    
            }
        })
    }
}
