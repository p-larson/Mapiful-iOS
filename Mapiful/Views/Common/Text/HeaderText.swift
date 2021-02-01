//
//  HeaderText.swift
//  Mapiful
//
//  Created by Peter Larson on 1/30/21.
//

import SwiftUI

public struct HeaderText: View {
    private let verbatim: String
    
    public init(_ verbatim: String) {
        self.verbatim = verbatim
    }
    
    public var body: some View {
        Text(verbatim)
            .font(.futuraCondensedMedium(24))
    }
}

struct HeaderText_Previews: PreviewProvider {
    static var previews: some View {
        HeaderText("Classic")
    }
}
