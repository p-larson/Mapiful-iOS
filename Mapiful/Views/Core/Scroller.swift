//
//  Scroller.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct ScrollerKey: EnvironmentKey {
    static let defaultValue: ScrollViewProxy? = nil
}

extension EnvironmentValues {
    var scroller: ScrollerKey.Value {
        get {
            return self[ScrollerKey.self]
        }
        
        set {
            self[ScrollerKey.self] = newValue
        }
    }
}
