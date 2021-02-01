//
//  SwiftUIView.swift
//  Mapiful
//
//  Created by Peter Larson on 1/30/21.
//

import SwiftUI

public struct TextFormatModifier: ViewModifier {
    public let fill: Bool
    public let alignment: Alignment
    public let horizontalPadding: Bool
    public let verticalPadding: Bool
    
    public init(
        fill: Bool = true,
        alignment: Alignment = .leading,
        horizontalPadding: Bool = true,
        verticalPadding: Bool = true
    ) {
        self.fill = fill
        self.alignment = alignment
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: fill ? .infinity : nil, alignment: alignment)
            .padding(.horizontal, horizontalPadding ? Format.horizontalPadding : 0)
            .padding(.vertical, verticalPadding ? Format.verticalPadding : 0)
    }
}

public extension View {
    func withTextFormating(_ format: TextFormatModifier = .init()) -> some View {
        self.modifier(format)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Peter Larson").withTextFormating()
        }
    }
}
