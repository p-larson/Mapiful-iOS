//
//  ThemeOptionView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct PalleteOptionView: View {
    let pallete: ClassicalPrintModel.Pallete
    
    var body: some View {
        switch pallete {
        case .uniform(let color):
            return AnyView(
                Capsule(style: .continuous)
                    .fill(color)
            )
        case .pair(let background, let overlay):
            return AnyView(
                ZStack {
                    Capsule(style: .continuous)
                        .fill(background)
                    Capsule(style: .continuous)
                        .fill(overlay)
                        .mask(
                            Rectangle()
                                .scaleEffect(x: 0.5, y: 1.0, anchor: .trailing)
                                .rotationEffect(.degrees(-45))
                                .scaleEffect(x: 2.0, y: 2.0, anchor: .center)
                        )
                }
            )
        }
    }
}

struct ThemeOptionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(
                ClassicalPrintModel.Pallete.allStyles,
                content: PalleteOptionView.init(pallete:)
            )
        }
    }
}
