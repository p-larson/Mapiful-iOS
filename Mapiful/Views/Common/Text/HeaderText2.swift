//
//  HeaderText2.swift
//  Mapiful
//
//  Created by Peter Larson on 1/31/21.
//

import SwiftUI

struct HeaderText2: View {
    private let verbatim: String
    
    public init(_ verbatim: String) {
        self.verbatim = verbatim
    }
    
    public var body: some View {
        Text(verbatim)
            .font(.futuraCondensedMedium(20))
    }
}

struct HeaderText2_Previews: PreviewProvider {
    static var previews: some View {
        HeaderText2("Header 2")
    }
}
