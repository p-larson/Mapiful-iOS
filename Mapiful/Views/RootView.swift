//
//  RootView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct RootView: View {
    
    @State private var tab = 0
    
    var body: some View {
        TabView(selection: $tab) {
            CatalogView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Shop")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
