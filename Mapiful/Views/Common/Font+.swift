//
//  Font+.swift
//  Mapiful
//
//  Created by Peter Larson on 1/31/21.
//

import SwiftUI

extension Font {
    static func futuraMedium(_ size: CGFloat) -> Font {
        .custom("Futura Medium", size: size)
    }
    
    static func futuraMediumItalic(_ size: CGFloat) -> Font {
        .custom("Futura Medium Italic", size: size)
    }
    
    static func futuraBold(_ size: CGFloat) -> Font {
        .custom("Futura Bold", size: size)
    }
    
    static func futuraCondensedMedium(_ size: CGFloat) -> Font {
        .custom("Futura Condensed Medium", size: size)
    }
    
    static func futuraCondensedExtraBold(_ size: CGFloat) -> Font {
        .custom("Futura Condensed ExtraBold", size: size)
    }
}

struct FontPreviews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Futura Medium")
                .font(.futuraMedium(16))
            
            Text("Futura Medium Italic")
                .font(.futuraMediumItalic(16))
            
            Text("Futura Bold")
                .font(.futuraBold(16))
            
            Text("Futura Condensed Medium")
                .font(.futuraCondensedMedium(16))
            
            Text("Futura Condensed ExtraBold")
                .font(.futuraCondensedExtraBold(16))
        }
    }
}
