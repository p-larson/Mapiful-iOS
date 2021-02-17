//
//  ClassicEditorFormatSection.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct ClassicEditorFormatSection: View {
    
    @EnvironmentObject var model: ClassicalPrintModel
    
    @State private var isPickingFormat = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Select Format")

                Button(action: {
                    self.isPickingFormat.toggle()
                }, label: {
                    Text(self.model.format.rawValue)
                })
                //.buttonStyle(PickerButtonStyle())
            }
            .padding(.horizontal, 20)

            Divider()
        }
        .id("format")
        .sheet(isPresented: $isPickingFormat, content: {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        self.isPickingFormat.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    Spacer()
                }
                .padding(.horizontal, 20)

                Text("Select Format")

                ScrollView {
                    ForEach(ClassicalPrintModel.Format.allCases, id: \.self, content: { format in
                        VStack {
                            Button(action: {
                                self.isPickingFormat.toggle()
                                self.model.format = format
                            }, label: {
                                HStack {
                                    FormatOptionView(format: format)
                                    VStack {
                                        Text(format.rawValue)
                                        Text(format.description)
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .padding(.horizontal, 20)
                                .frame(height: 80)
                            })
                            .frame(maxWidth: .infinity)

                            if format != ClassicalPrintModel.Format.allCases.last! {
                                Divider()
                            }
                        }
                    })
                    .foregroundColor(.label)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .padding(.top, 20)
        })
    }
}

struct ClassicEditorFormatSection_Previews: PreviewProvider {
    static var previews: some View {
        ClassicEditorFormatSection()
    }
}
