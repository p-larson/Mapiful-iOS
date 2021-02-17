//
//  ClassicEditorHeaderView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct ClassicEditorHeaderSection: View {
    
    @Environment(\.scroller) var scroller: ScrollerKey.Value
    
    var body: some View {
        VStack(spacing: 20) {
            
//                .background(Color.background)
            
            Text("Customize Your Map")
            
            HStack(spacing: 10) {
                Button(action: {
                    withAnimation(.easeInOut) {
//                        scroller?.scrollTo(, anchor: .bottom)
                    }
                }, label: {
                    Image(systemName: "mappin")
                })
                Button(action: {
                    withAnimation(.easeInOut) {
                        scroller?.scrollTo("theme", anchor: .bottom)
                    }
                }, label: {
                    Image(systemName: "doc.richtext")
                })
                Button(action: {
                    withAnimation(.easeInOut) {
                        scroller?.scrollTo("labels", anchor: .bottom)
                    }
                }, label: {
                    Image(systemName: "textformat")
                })
                Button(action: {
                    withAnimation(.easeInOut) {
                        scroller?.scrollTo("style", anchor: .bottom)
                    }
                }, label: {
                    Image(systemName: "circle.lefthalf.fill")
                })
                // Size
                Button(action: {
                    withAnimation(.easeInOut) {
                        scroller?.scrollTo("size", anchor: .bottom)
                    }
                }, label: {
                    Image(systemName: "aspectratio.fill")
                })
                
                // Orientation
                Button(action: {
                    withAnimation(.easeInOut) {
                        scroller?.scrollTo("orientation", anchor: .bottom)
                    }
                }, label: {
                    Image(systemName: "crop.rotate")
                })
            }
            .buttonStyle(MenuButtonStyle())
            
            Divider()
        }
    }
}

struct ClassicEditorHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                ClassicEditorHeaderSection()
                    .environmentObject(demoClassicalPrints.first!)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
