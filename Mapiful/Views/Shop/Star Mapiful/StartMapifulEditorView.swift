//
//  StartMapifulEditorView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/22/21.
//

import SwiftUI

struct StartMapifulEditorView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ScrollViewReader { scroller in
                VStack(spacing: 20) {
                    StarEditorLocationSection()
                    StarEditorDateSection()
                    StarEditorStyleSection()
                    StarEditorLabelSection()
                    StarEditorSizeSection()
                }
                .environment(\.scroller, scroller)
            }
        }
    }
}

struct StartMapifulEditorView_Previews: PreviewProvider {
    static var previews: some View {
        StartMapifulEditorView()
    }
}
