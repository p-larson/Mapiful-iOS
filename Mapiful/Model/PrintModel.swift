//
//  PrintModel.swift
//  Mapiful
//
//  Created by Peter Larson on 11/4/20.
//

import SwiftUI
import CoreLocation

public class PrintModel: ObservableObject {
    @Published public var size: PrintSize
    @Published public var orientation: Orientation
    @Published public var price: Int
    
    public init(
        size: PrintSize,
        orientation: PrintOrientation,
        price: Int = 0
    ) {
        self.size = size
        self.orientation = orientation
        self.price = price
    }
}

extension PrintModel {
    public enum Orientation: String {
        case portait = "Portait"
        case landscape = "Landscape"
    }
}

extension PrintModel {
    public enum Size: RawRepresentable, Hashable {
        public typealias RawValue = CGSize
        case centimeters(width: Int, height: Int)
        case inches(width: Int, height: Int)
        public static let w30h40: Size    = .centimeters(width: 30, height: 40)        // 30x40cm
        public static let w50h70: Size    = .centimeters(width: 50, height: 70)        // 50x70cm
        public static let w70h100: Size   = .centimeters(width: 70, height: 100)       // 70x100cm
        public static let w11h17: Size    = .inches(width: 11, height: 17)    // 11×17″
        public static let w18h24: Size    = .inches(width: 18, height: 24)    // 18×24″
        public static let w24h36: Size    = .inches(width: 24, height: 36)    // 24×36″

        public static let allCases: [Size] = [
            w30h40,
            w50h70,
            w70h100,
            w11h17,
            w18h24,
            w24h36
        ]

        public static var inches: [Size] {
            Self.allCases.filter {
                switch $0 {
                case .centimeters:
                    return false
                case .inches:
                    return true
                }
            }
        }
        // swiftlint:disable:next identifier_name
        public static var cm: [Size] {
            Self.allCases.filter {
                switch $0 {
                case .centimeters:
                    return true
                case .inches:
                    return false
                }
            }
        }

        public var string: String {
            switch self {
            case .centimeters(let width, let height):
                return "\(width)x\(height)cm"
            case .inches(let width, let height):
                return "\(width)x\(height)\""
            }
        }

        public func hash(into hasher: inout Hasher) {
            switch self {
            case .centimeters(let width, let height):
                hasher.combine(width)
                hasher.combine(height)
                return
            case .inches(let width, let height):
                hasher.combine(width)
                hasher.combine(height)
                return
            }
        }

        public var rawValue: CGSize {
            switch self {
            case .centimeters(let width, let height):
                return CGSize(width: width, height: height)
            case .inches(let width, let height):
                return CGSize(width: width, height: height)
            }
        }

        public init?(rawValue: CGSize) {
            return nil
        }

        static var magnitude: Size {
            return w24h36
        }
    }
}

public typealias PrintSize = PrintModel.Size
public typealias PrintOrientation = PrintModel.Orientation
