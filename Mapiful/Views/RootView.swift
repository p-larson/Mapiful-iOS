//
//  RootView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI
import StatefulTabView

struct RootView: View {
    let iconSize = CGSize(width: 24, height: 24)
    
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            StatefulTabView.init(selectedIndex: $selectedIndex) {
                Tab(
                    title: "Shop",
                    image: UIImage(named: "shop")?.resize(targetSize: iconSize)
                ) {
                    CatalogView()
                }
                
                Tab(
                    title: "Explore",
                    image: UIImage(named: "search")?.resize(targetSize: iconSize)
                ) {
                    CatalogView()
                }
                
                Tab(
                    title: "Saved",
                    image: UIImage(named: "bookmarks")?.resize(targetSize: iconSize)
                ) {
                    CatalogView()
                }
                
                Tab(
                    title: "Profile",
                    image: UIImage(named: "person")?.resize(targetSize: iconSize)
                ) {
                    CatalogView()
                }
                
                Tab(
                    title: "Cart",
                    systemImageName: "cart"
                ) {
                    CatalogView()
                }
            }
            .barTintColor(UIColor(Color.label))
            .unselectedItemTintColor(UIColor(Color.secondary))
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
