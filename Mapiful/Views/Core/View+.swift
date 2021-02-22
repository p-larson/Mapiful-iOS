//
//  View+.swift
//  Mapiful
//
//  Created by Peter Larson on 2/10/21.
//

import SwiftUI

// Don't rewrite the wheel.

extension View {
    func horizontalPadding() -> some View {
        self.padding(.horizontal, 20)
    }
    
    func format() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func geometry(do: @escaping (CGRect) -> ()) -> some View {
        self.background(
            GeometryReader { reader -> Color in
                DispatchQueue.main.async {
                    `do`(reader.frame(in: .global))
                }
                return Color.clear
            }
        )
    }
}
