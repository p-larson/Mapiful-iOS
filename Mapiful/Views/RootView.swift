//
//  RootView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct RootView: View {
    let iconSize = CGSize(width: 24, height: 24)
    
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            CatalogView()
                .tabItem {
                    Label("Store", image: "shop")
                }
            AccountView()
        }
    }
}

fileprivate extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
