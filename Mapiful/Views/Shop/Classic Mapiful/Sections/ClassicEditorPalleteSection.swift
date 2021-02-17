//
//  ClassicEditorPalleteSection.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct ClassicEditorPalleteSection: View {
    
    @EnvironmentObject var model: ClassicalPrintModel
    
    // There definitely is a better way to do this view, like a Grid or something
    // but I don't really see anything super wrong with this.
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Choose Map Style")
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    ForEach(ClassicalPrintModel.Pallete.allStyles[0 ..< 6], id: \.id) { pallete in
                        Button(action: {
                            self.model.pallete = pallete
                        }, label: {
                            PalleteOptionView(
                                pallete: pallete
                            )
                                .aspectRatio(1.0, contentMode: .fit)
                        })
                        .buttonStyle(
                            OptionButtonStyle(selected: pallete == model.pallete)
                        )
                    }
                }
                .padding(.horizontal, 20)

                HStack(spacing: 10) {
                    ForEach(ClassicalPrintModel.Pallete.allStyles[6 ..< 12], id: \.hashValue) { pallete in
                        Button(action: {
                            self.model.pallete = pallete
                        }, label: {
                            PalleteOptionView(pallete: pallete)
                                .aspectRatio(1.0, contentMode: .fit)
                        })
                        .buttonStyle(
                                OptionButtonStyle(selected: pallete == model.pallete)
                        )
                    }
                }
                .padding(.horizontal, 20)

                HStack(spacing: 10) {
                    ForEach(ClassicalPrintModel.Pallete.allStyles[12 ..< 16], id: \.self) { pallete in
                        Button(action: {
                            self.model.pallete = pallete
                        }, label: {
                            PalleteOptionView(pallete: pallete)
                                .aspectRatio(1.0, contentMode: .fit)
                        })
                        .buttonStyle(
                            OptionButtonStyle(selected: pallete == model.pallete)
                        )
                    }
                    // Ghost
                    PalleteOptionView(pallete: .uniform(Color.clear)).hidden()
                        .aspectRatio(1.0, contentMode: .fit)
                    // Ghost
                    PalleteOptionView(pallete: .uniform(Color.clear)).hidden()
                        .aspectRatio(1.0, contentMode: .fit)

                }
                .padding(.horizontal, 20)

                Divider()
            }
        }
        .animation(.easeInOut(duration: 0.3))
        .id("style")
    }
}

struct ClassicEditorPalleteSection_Previews: PreviewProvider {
    static var previews: some View {
        ClassicEditorPalleteSection()
            .environmentObject(demoClassicalPrints.first!)
    }
}
