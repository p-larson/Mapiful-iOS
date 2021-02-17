//
//  ClassicEditorLabelSection.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct ClassicEditorLabelSection: View {
    @State private var headline = String()
    @State private var divider = String()
    @State private var tagline = String()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Configure Labels")
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Headline")
                    Text("Divider")
                    Text("Tagline")
                }

                VStack(spacing: 20) {
                    TextField("A city name maybe?", text: $headline)
                    TextField("A country perhaps?", text: $divider)
                    TextField("Some Cordinates?", text: $tagline)
                }
            }
            .padding(.horizontal, 20)

            Divider()
        }
        .id("labels")
    }
}

struct ClassicEditorLabelSection_Previews: PreviewProvider {
    static var previews: some View {
        ClassicEditorLabelSection()
    }
}
