//
//  BodyText.swift
//  Mapiful
//
//  Created by Peter Larson on 1/30/21.
//

import SwiftUI

public struct BodyText: View {
    private let verbatim: String
    
    public init(_ verbatim: String) {
        self.verbatim = verbatim
    }
    
    public var body: some View {
        Text(verbatim)
            .font(.futuraMedium(18))
    }
}

struct BodyText_Previews: PreviewProvider {
    static var previews: some View {
        BodyText("Body")
    }
}
