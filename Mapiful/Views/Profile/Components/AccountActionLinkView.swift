//
//  AccountActionLinkView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/18/21.
//

import SwiftUI

struct AccountActionLink: Identifiable {
    let name: String
    let image: String
    // TODO:
    let target: AnyView = AnyView(EmptyView())
    let id = UUID()
}

let accountActionLinks = [
    AccountActionLink(
        name: "My Orders",
        image: "shippingbox"
    ),
    AccountActionLink(
        name: "Notification Settings",
        image: "bell"
    ),
    AccountActionLink(
        name: "Write a Review",
        image: "pencil"
    )
]

struct AccountActionLinkView: View {
    
    let model: AccountActionLink
    
    var body: some View {
        NavigationLink.init(
            destination: Text("Waa waa wee waa"), // TODO:
            label: {
                HStack(spacing: 0) {
                    Image(systemName: model.image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Text(model.name)
                        .font(.system(Font.TextStyle.title2, design: Font.Design.rounded))
                        .fontWeight(Font.Weight.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .aspectRatio(6, contentMode: .fit)
                .foregroundColor(.label)
            }
        )
    }
}

struct AccountActionLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AccountActionLinkView(model: accountActionLinks.first!)
    }
}
