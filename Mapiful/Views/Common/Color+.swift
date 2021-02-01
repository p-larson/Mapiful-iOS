//
//  Color.swift
//  Mapiful
//
//  Created by Peter Larson on 1/30/21.
//

import SwiftUI

extension Color {
    static var theme: Color { Color(#colorLiteral(red: 0.07843137255, green: 0.5882352941, blue: 0.4941176471, alpha: 1)) /* 20 150 126 */ }
    static var cream: Color { Color(#colorLiteral(red: 0.9803921569, green: 0.9333333333, blue: 0.9137254902, alpha: 1)) /* 250 238 233 */ }
    static var basic: Color { Color(#colorLiteral(red: 0.231372549, green: 0.2784313725, blue: 0.337254902, alpha: 1)) /* 59 71 86 */ }
    static var cloud: Color { Color(#colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.9882352941, alpha: 1)) /* 241 245 252 */ }

    static var random: Color {
        Color.init(
            red: .random(in: 0 ..< 1),
            green: .random(in: 0 ..< 1),
            blue: .random(in: 0 ..< 1)
        )
    }
}

struct Color_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        VStack {
            Color.theme
            Color.cream
            Color.basic
            Color.cloud
        }
    }
}
