//
//  Color.swift
//  Mapiful
//
//  Created by Peter Larson on 1/30/21.
//

import SwiftUI

extension Color {
    static var random: Color {
        Color.init(
            red: .random(in: 0 ..< 1),
            green: .random(in: 0 ..< 1),
            blue: .random(in: 0 ..< 1)
        )
    }
}

extension Color {
    // TODO
    static var header: Color {
        Color(#colorLiteral(red: 0.2731560585, green: 0.3762338165, blue: 0.4071571439, alpha: 1))
    }
    
    static var selectionBackground: Color {
        Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    
    static var unselectedBackground: Color {
        Color(#colorLiteral(red: 0.9352454769, green: 0.9352454769, blue: 0.9352454769, alpha: 1))
    }
    
    // TODO
    static var footer: Color {
        Color(#colorLiteral(red: 0.2195505208, green: 0.3062152002, blue: 0.3293257813, alpha: 1))
        
    }
    // TODO
    static var footerLabel: Color {
        Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    
    
    static var background: Color {
        Color(#colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.9882352941, alpha: 1))
    }
    
    static var label: Color {
        Color(#colorLiteral(red: 0.231372549, green: 0.2784313725, blue: 0.337254902, alpha: 1))
    }
    
    static var secondaryLabel: Color {
        Color(#colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }
    
    static var action: Color {
        Color(#colorLiteral(red: 0, green: 0.6470588235, blue: 0.5647058824, alpha: 1))
    }
    
    // ALIAS
    static var selected: Color {
        label
    }
}

struct PalletePreviews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Color.header.overlay(Text("header"))
            Color.selectionBackground.overlay(Text("selected background"))
            Color.unselectedBackground.overlay(Text("unselected background"))
            Color.footer.overlay(Text("footer"))
            Color.footerLabel.overlay(Text("footer label"))
            Color.background.overlay(Text("background"))
            Color.label.overlay(Text("label"))
            Color.secondaryLabel.overlay(Text("secondary label"))
            Color.action.overlay(Text("action"))
        }
        .ignoresSafeArea()
    }
}
