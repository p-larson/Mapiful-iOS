//
//  AccountRootView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/18/21.
//

import SwiftUI

struct AccountView: View {
        
    var body: some View {
        VStack {
            AccountActionSection()
            AccountFooterSection()
        }
    }
}

struct AccountRootView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
