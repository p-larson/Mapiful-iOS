//
//  ClassicEditorFooter.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct ClassicEditorFooter: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 20) {
                Text("Looking good!")
                Text("Proceed with your order.")
                    .padding(.bottom, 20)
            }
            BookmarkDesignView()
            StartCheckoutView()
        }
    }
}

struct ClassicEditorFooter_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            Spacer()
            ClassicEditorFooter()
        }
    }
}
