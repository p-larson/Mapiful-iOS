//
//  ClassicView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/15/21.
//

import SwiftUI

// TODO:
// This is just a mockup view as of now. It will need to render the
// actual product properly.
//
// I'm assuming we'll have to use generator.mapiful.com of some sorts.
// Proabably encapsulate a local web file to interact with?
//
// Will need to council with Mapiful's native developers to see the best
// option to replicate their product view.
//
// Until then, we use a pre-rendered mock photo at scale. Does not update.

struct ClassicProductView: View {
    @EnvironmentObject var model: ClassicalPrintModel
    private let tileLength: CGFloat = UIScreen.main.bounds.size.width / ClassicalPrintModel.Size.magnitude.rawValue.width
    var body: some View {
        Image("map-demo")
            .resizable()
            .aspectRatio(model.size.rawValue, contentMode: .fill)
            .frame(
                width: tileLength * model.size.rawValue.width,
                height: tileLength * model.size.rawValue.height,
                alignment: .center
            )
            .padding(10)
            .background(Color.white)
            .frame(maxWidth: .infinity)
            .compositingGroup()
            .shadow(radius: 5)
            .padding()
            .background(Color.background)
    }
}

struct ClassicView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicProductView()
            .environmentObject(ClassicalPrintModel())
    }
}
