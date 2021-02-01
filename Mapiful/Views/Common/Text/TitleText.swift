//
//  TitleText.swift
//  Mapiful
//
//  Created by Peter Larson on 1/30/21.
//

import SwiftUI

public struct TitleText: View {
    private let verbatim: String
    
    public init(_ verbatim: String) {
        self.verbatim = verbatim
    }
    
    public var body: some View {
        Text(verbatim)
            .font(.futuraBold(TextSize.title))
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText("Title")
    }
}
