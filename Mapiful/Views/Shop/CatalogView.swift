//
//  CatalogView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/7/21.
//

import SwiftUI
import Haptica
import URLImage

// what the heck is this
// https://generator.mapiful.com ?

struct CatalogView: View {
    // Constants
    let pageAnimation = Animation.easeOut(duration: 0.3)
    let descriptionAnimation = Animation.easeIn(duration: 0.5)
    let actionAnimation = Animation.easeIn(duration: 0.3)
    let horizontalSpacing: CGFloat = 16
    let verticalSpacing: CGFloat = 16
    let padding: CGFloat = 32
    // State
    @State private var slide: Edge = .leading
    @State private var selectedIndex = 0 {
        willSet {
            if newValue < selectedIndex {
                slide = .leading
            } else {
                slide = .trailing
            }
        }
        
        didSet {
            // Reset State
            DispatchQueue.main.async {
                withAnimation(pageAnimation) {
                    scrollOffset = 0
                    selectionOffset = partitions[0 ..< selectedIndex].reduce(CGFloat(0), +) + CGFloat(selectedIndex) * horizontalSpacing
                    
                    if oldValue == selectedIndex {
                        // Animate if did not change selectedIndex.
                        parallaxOffset = 0
                    }
                }
                
                if oldValue != selectedIndex {
                    // No Animation if changed selectedIndex.
                    parallaxOffset = 0
                }
            }
            // Haptic feedback
            Haptic.selection.generate()
        }
    }
    @State private var parallaxOffset: CGFloat
    @State private var selectionOffset: CGFloat
    @State private var scrollOffset: CGFloat
    @State private var partitions: [CGFloat]
    // Animation State
    @State private var descriptorID: Int = 0
    // Initialize a new Catalog View
    init() {
        self._parallaxOffset = State<CGFloat>(initialValue: 0)
        self._selectionOffset = State<CGFloat>(initialValue: 0)
        self._scrollOffset = State<CGFloat>(initialValue: 0)
        self._partitions = State<[CGFloat]>(initialValue: (products.map {_ in 0}) )
    }
    
    func onDrag(value drag: DragGesture.Value) {
        if selectedIndex == 0 {
            self.scrollOffset = max(-horizontalSpacing, drag.translation.width)
        } else if selectedIndex == products.count - 1 {
            self.scrollOffset = min(horizontalSpacing, drag.translation.width)
        } else {
            self.scrollOffset = drag.translation.width
        }
        
        self.parallaxOffset = scrollOffset
    }
    
    func onDragEnded(value _: DragGesture.Value) {
        var movement = 0
        var x = scrollOffset
        let forwards = scrollOffset > 0
        let range: [CGFloat] = forwards ? Array(partitions[selectedIndex...].dropFirst()) : partitions[0 ..< selectedIndex].reversed()
        let sign = forwards ? 1 : -1
        
        for partition in range {
            if (forwards && horizontalSpacing < x) || (!forwards && x < -horizontalSpacing) {
                movement += 1
            } else {
                break
            }
            
            x -= (partition + horizontalSpacing) * CGFloat(sign)
        }
        
        selectedIndex += movement * sign
    }
    
    var background: some View {
        products[selectedIndex].image
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .transition(
                AnyTransition
                    .asymmetric(
                        insertion:AnyTransition.opacity,
                        removal: AnyTransition.identity
                    )
                    .animation(pageAnimation)
            )
            .grayscale(1/3)
            .id(selectedIndex)
            // parallax scroll
            .offset(x: -padding)
            .offset(x: -max(-padding, min(padding, parallaxOffset)) / 2)
    }
    
    func overlay(with reader: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: verticalSpacing) {
                HStack(spacing: horizontalSpacing) {
                    ForEach(products.indices) { index -> AnyView in
                        let product = products[index]
                        let view = Text(verbatim: product.name)
                            .kerning(1.0)
                            .font(
                                .system(.title2, design: .serif)
                            )
                            .fontWeight(.bold)
                            .fixedSize()
                            .onTapGesture {
                                self.selectedIndex = index
                            }
                            .geometry { (frame) in
                                self.partitions[index] = frame.size.width
                            }
                            .blur(radius: selectedIndex == index ? 0 : 1)
                        return AnyView(view)
                    }
                    .offset(x: -selectionOffset)
                    .offset(x: -scrollOffset)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                RoundedRectangle(cornerRadius: 1)
                    .frame(width: 20, height: 2)
                Text(products[selectedIndex].description)
                    .italic()
                    .fontWeight(Font.Weight.ultraLight)
                    .font(
                        .system(.body, design: .serif)
                    )
                    .frame(width: reader.size.width * 2 / 3, alignment: .leading)
                    .id(selectedIndex)
            }
            // Contrast
            .foregroundColor(.white)
            .blendMode(BlendMode.difference)
            // Frame
            .padding(.leading, padding)
            .padding(.bottom, verticalSpacing)
            Spacer()
            // Action Buttons
            HStack {
                ForEach(products[selectedIndex].actions, id: \.self) { action in
                    NavigationLink(destination: action.view) {
                        action.button.view
                    }
                }
            }
            .horizontalPadding()
            .padding(.bottom)
            .transition(
                AnyTransition.asymmetric(
                    insertion: AnyTransition
                        .move(edge: .bottom)
                        .combined(
                            with: AnyTransition
                                .opacity
                        ),
                    removal: AnyTransition.identity
                )
            )
            .id(selectedIndex)
        }
        .frame(
            width: reader.size.width,
            height: reader.size.height,
            alignment: .leading
        )
    }
    
    var body: some View {
        GeometryReader { reader in
            background
            overlay(with: reader)
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged(onDrag(value:))
                .onEnded(onDragEnded(value:))
        )
        .animation(pageAnimation, value: selectedIndex)
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
