//
//  AccountActionSection.swift
//  Mapiful
//
//  Created by Peter Larson on 2/18/21.
//

import SwiftUI

struct AccountActionSection: View {
    var body: some View {
        List(
            accountActionLinks,
            rowContent: AccountActionLinkView.init(model:)
        )
        .listStyle(PlainListStyle())
    }
}

struct AccountActionSection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountActionSection()
        }
    }
}
