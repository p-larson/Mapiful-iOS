//
//  ClassicEditorView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/15/21.
//

import SwiftUI
import Haptica

struct ClassicalPrintEditorView: View {
    
    public enum Sections: String {
        case location
        case format
        case label
        case pallete
        case size
        case orientation
        case footer
    }

    // TODO:
    @ObservedObject var model = ClassicalPrintModel()
    
    @Environment(\.presentationMode) var presentationMode

    @State private var address  = String()
    @State private var longitude = String()
    @State private var latitude = String()
    @State private var isPickingFormat = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            ScrollViewReader { scrollProxy in
                VStack(spacing: 20) {
                    ClassicEditorHeaderSection()
                    ClassicEditorLocationSection()
                    ClassicEditorFormatSection()
                    ClassicEditorLabelSection()
                    ClassicEditorPalleteSection()
                    ClassicEditorSizeSection()
                    ClassicEditorOrientationSection()
                    ClassicEditorFooter()
                }
                .environment(\.scroller, scrollProxy)
                // TODO: The model will be injected earlier in the view cycle. I think.
                .environmentObject(model)
            }
        })
        .navigationBarItems(trailing: HStack {
            Image(systemName: "bookmark")
            Image(systemName: "cart")
        })
        .navigationBarTitle("Classical Print", displayMode: .inline)
    }
}

struct ClassicalPrintEditor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavigationLink(
                "Classical Print Editor",
                destination: ClassicalPrintEditorView()
                    .environmentObject(demoClassicalPrints.first!),
                isActive: .constant(true)
            )
        }
    }
}
