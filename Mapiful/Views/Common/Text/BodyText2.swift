//
//  BodyText2.swift
//  Mapiful
//
//  Created by Peter Larson on 1/31/21.
//

import SwiftUI

struct BodyText2: View {
    private let verbatim: String
    
    public init(_ verbatim: String) {
        self.verbatim = verbatim
    }
    
    public var body: some View {
        Text(verbatim)
            .font(.futuraMedium(15))
    }
}

struct BodyText2_Previews: PreviewProvider {
    static var previews: some View {
        BodyText2("Body 2")
    }
}
