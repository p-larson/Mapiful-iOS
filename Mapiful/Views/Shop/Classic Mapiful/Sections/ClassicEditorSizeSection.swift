//
//  ClassicEditorSizeSection.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

// TODO: I suspect that this component is not exclusive to the
// Classical Mapiful Product Editor, will most likely reuse.
// Rename/Refactor is inevitable it seems.

struct ClassicEditorSizeSection: View {
    
    @EnvironmentObject var model: ClassicalPrintModel
    
    @State private var isPickingSize = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Choose Size")
                Spacer()
                Button(action: {
                    self.isPickingSize.toggle()
                }, label: {
                    Text(self.model.size.string)
                })
                .buttonStyle(PickerButtonStyle())
            }
            .padding(.horizontal, 20)

            Divider()
        }
        .sheet(isPresented: $isPickingSize, content: {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        self.isPickingSize.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    Spacer()
                }
                .padding(.horizontal, 20)

                ScrollView {
                    Text("Inches")
                    ForEach(ClassicalPrintModel.Size.inches, id: \.self, content: { size in
                        VStack {
                            Button(action: {
                                self.isPickingSize.toggle()
                                self.model.size = size
                            }, label: {
                                HStack {
                                    Rectangle()
                                        .aspectRatio(size.rawValue, contentMode: .fit)
                                        .foregroundColor(.label)
                                    Text(size.string)
                                    Image(systemName: "chevron.right")
                                }
                                .padding(.horizontal, 20)
                                .frame(height: 50)
                            })
                        }
                    })
                    Text("CM")
                    ForEach(ClassicalPrintModel.Size.allCases, id: \.self, content: { size in
                        VStack {
                            Button(action: {
                                self.isPickingSize.toggle()
                                self.model.size = size
                            }, label: {
                                HStack {
                                    Rectangle()
                                        .aspectRatio(size.rawValue, contentMode: .fit)
                                        .foregroundColor(.label)
                                    Text(verbatim: size.string)
                                    Image(systemName: "chevron.right")
                                }
                                .padding(.horizontal, 20)
                                .frame(height: 50)
                            })
                        }
                    })
                }
                .foregroundColor(.label)
            }
            .edgesIgnoringSafeArea(.bottom)
            .padding(.top, 20)
        })
        .id("size")
    }
}

struct ClassicEditorSizeSection_Previews: PreviewProvider {
    static var previews: some View {
        ClassicEditorSizeSection()
    }
}
