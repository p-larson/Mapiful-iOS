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
}

extension View {
    func outline() -> some View {
        self.overlay(Rectangle().stroke(Color.red, lineWidth: 1.0))
    }
}
