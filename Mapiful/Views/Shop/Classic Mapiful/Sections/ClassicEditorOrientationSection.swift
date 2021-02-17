//
//  ClassicEditorOrientationSection.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI
import Haptica

struct ClassicEditorOrientationSection: View {
    
    @EnvironmentObject var model: ClassicalPrintModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Choose Orientation")
            
            Toggle("Portrait", isOn: Binding<Bool>(get: {
                self.model.orientation == .portait
            }, set: { value in
                withAnimation(.spring()) {
                    self.model.orientation = value ? .portait : .landscape
                }

                Haptic.selection.generate()
            }))
            .horizontalPadding()
            
            Toggle("Landscape", isOn: Binding<Bool>(get: { () -> Bool in
                self.model.orientation == .landscape
            }, set: { value in
                withAnimation(.spring()) {
                    self.model.orientation = value ? .landscape : .portait
                }

                Haptic.selection.generate()
            }))
            .horizontalPadding()

            Divider()
        }
        .id("orientation")
    }
}

struct ClassicEditorOrientationSection_Previews: PreviewProvider {
    static var previews: some View {
        ClassicEditorOrientationSection()
    }
}
