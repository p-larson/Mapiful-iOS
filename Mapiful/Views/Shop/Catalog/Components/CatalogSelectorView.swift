//
//  CatalogSelectorView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/22/21.
//

import SwiftUI

struct CatalogSelectorView: View {
    
    @Binding var selectedIndex: Int
    @Binding var partitions: [CGFloat]
    
    var body: some View {
        LazyHStack(spacing: 40) {
            ForEach(products.indices) { index -> AnyView in
                let product = products[index]
                let view = Text(verbatim: product.name)
                    .kerning(1.0)
                    .font(
                        .system(.title2, design: .serif)
                    )
                    .fontWeight(.bold)
                    .fixedSize()
                    .onTapGesture {
                        self.selectedIndex = index
                    }
                    .blur(radius: selectedIndex == index ? 0 : 1)
                    .geometry { (rect) in
                        partitions[index] = rect.width
                    }
                
                return AnyView(view)
            }
        }
        .padding(.leading)
        .fixedSize()
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct CatalogSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogSelectorView(selectedIndex: .constant(0))
    }
}
