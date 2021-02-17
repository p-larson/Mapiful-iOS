//
//  CheckoutView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

// TODO: Refactor

struct StartCheckoutView: View {
    var body: some View {
        Button(
            action: {
                // TODO:
            },
            label: {
                HStack {
                    Image(systemName: "cart.fill.badge.plus")
                        .resizable()
                        .scaledToFit()
                    Text("$0")
                        .font(.system(size: 16, weight: .black, design: .monospaced))
                    Spacer()
                    Text("Add to Cart")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                .foregroundColor(.white)
                .frame(height: 30)
                .padding(.horizontal, 20)
                .padding(.vertical, 24)
                .background(
                    Color.action
                        .padding(.bottom, -UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.bottom)
                )
                .overlay(
                    Text("Mapiful © 2020")
                        .padding(.top, 54 + 200)
                )
            }
        )
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        StartCheckoutView()
    }
}
