//
//  SelectionGesture.swift
//  Mapiful
//
//  Created by Peter Larson on 2/22/21.
//

import SwiftUI

struct SelectionGesture: Gesture {
    
    @Binding var scrollOffset: CGFloat
    @Binding var parallaxOffset: CGFloat
    @Binding var selectedIndex: Int
    @Binding var partitions: [CGFloat]
    
    func onChanged(_ value: DragGesture.Value) {
        if selectedIndex == 0 {
            self.scrollOffset = max(-CatalogView2.horizontalSpacing, value.translation.width)
        } else if selectedIndex == products.count - 1 {
            self.scrollOffset = min(CatalogView2.horizontalSpacing, value.translation.width)
        } else {
            self.scrollOffset = value.translation.width
        }
        
        self.parallaxOffset = scrollOffset
    }
    
    func onEnded(_ value: DragGesture.Value) {
        var movement = 0
        var x = scrollOffset
        let forwards = scrollOffset > 0
        let range: [CGFloat] = forwards ? Array(partitions[selectedIndex...].dropFirst()) : partitions[0 ..< selectedIndex].reversed()
        let sign = forwards ? 1 : -1
        
        for partition in range {
            if (forwards && CatalogView2.horizontalSpacing < x) || (!forwards && x < -CatalogView2.horizontalSpacing) {
                movement += 1
            } else {
                break
            }
            
            x -= (partition + CatalogView2.horizontalSpacing) * CGFloat(sign)
        }
        
        selectedIndex += movement * sign
    }
    
    var body: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged(onChanged(_:))
            .onEnded(onEnded(_:))
    }
}
