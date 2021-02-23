//
//  StarPrintModel.swift
//  Mapiful
//
//  Created by Peter Larson on 2/22/21.
//

import SwiftUI
import CoreLocation

public class StarPrintModel: PrintModel {
    @Published public var date = Date()
    @Published public var location: CLLocationCoordinate2D
    @Published public var style

}
