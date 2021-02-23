//
//  CatalogView2.swift
//  Mapiful
//
//  Created by Peter Larson on 2/21/21.
//

import SwiftUI

struct CatalogView2: View {
    static let horizontalSpacing: CGFloat = 16
    static let verticalSpacing: CGFloat = 16
    static let padding: CGFloat = 32
    
    @State private var selectedIndex = 0
    @State private var parallaxOffset: CGFloat = 0
    @State private var selectionOffset: CGFloat = 0
    @State private var scrollOffset: CGFloat = 0
    @State private var partitions: [CGFloat]
    
    init() {
        self._partitions = State<[CGFloat]>(initialValue: (products.map {_ in 0}) )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CatalogSelectorView(
                selectedIndex: $selectedIndex,
                partitions: $partitions
            )
            
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 20, height: 2)
                .padding(.leading)
            Text(products[0].description)
                .italic()
                .fontWeight(Font.Weight.ultraLight)
                .font(
                    .system(.body, design: .serif)
                )
                .padding(.leading)
            Spacer()
        }
        .background(
            CatalogBackdropView(
                selectedIndex: $selectedIndex,
                parallaxOffset: $parallaxOffset
            )
        )
    }
}

struct CatalogView2_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView2()
    }
}
