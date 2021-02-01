//
//  BodyText3.swift
//  Mapiful
//
//  Created by Peter Larson on 1/31/21.
//

import SwiftUI

struct BodyText3: View {
    private let verbatim: String
    
    public init(_ verbatim: String) {
        self.verbatim = verbatim
    }
    
    public var body: some View {
        Text(verbatim)
            .font(.futuraMedium())
    }
}

struct BodyText3_Previews: PreviewProvider {
    static var previews: some View {
        BodyText3("Body 3")
    }
}
