//
//  CatalogBackdropView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/22/21.
//

import SwiftUI

struct CatalogBackdropView: View {
    
    @Binding var selectedIndex: Int
    @Binding var parallaxOffset: CGFloat
    
    var image: Image {
        products[selectedIndex].image
    }
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .transition(
                AnyTransition
                    .asymmetric(
                        insertion:AnyTransition.opacity,
                        removal: AnyTransition.identity
                    )
            )
            .grayscale(1/3)
            .id(selectedIndex)
            .animation(
                Animation.easeInOut,
                value: selectedIndex
            )
            .offset(
                x: -CatalogView2.padding
            )
            .offset(
                x: -max(
                        -CatalogView2.padding,
                        min(
                            CatalogView2.padding,
                            parallaxOffset
                        )
                    ) / 2
            )
    }
}
