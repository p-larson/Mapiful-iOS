//
//  ClassicPrintModel.swift
//  Mapiful
//
//  Created by Peter Larson on 2/16/21.
//

import SwiftUI
import CoreLocation

public class ClassicalPrintModel: PrintModel {
    @Published public var headline: String
    @Published public var divider: String
    @Published public var tagline: String?
    @Published public var location: CLLocationCoordinate2D
    @Published public var zoom: Int = 1
    @Published public var hideTagline: Bool = false
    @Published public var format = Format.modern
    @Published public var pallete = Pallete.allStyles.first!

    public init(size: PrintSize = .w11h17, orientation: PrintOrientation = .portait) {
        self.headline = "Austin"
        self.divider = "Texas"
        self.tagline = nil
        self.location = CLLocationCoordinate2DMake(30.266666, -97.733330)
        super.init(size: size, orientation: orientation)
        // Necessary for Self publishers to fire off to Super's ObservableObject protocol.
        _ = self.objectWillChange.append(super.objectWillChange)
    }
}


extension ClassicalPrintModel {
    public enum Format: String, CaseIterable {
        case modern = "Modern"
        case legend = "Legend"
        case pantone = "Pantone"
        case smooth = "Smooth"
        case valentine = "Valentine"
        case humble = "Humble"
        case playroom = "Playroom"
        case niara = "Niara"
        case gaia = "Gaia"

        static var all: [String] {
            Self.allCases.map { $0.rawValue }
        }

        var description: String {
            switch self {
            case .modern:
                return "Basic Border, Vertical Labels with Position."
            case .legend:
                return "Borderless, Boxed Vertical Labels with Position."
            case .pantone:
                return "Bottom Border with Left-Aligned Vertical Labels with Position."
            case .smooth:
                return "Borderless, Faded Bottom with Vertical Labels with Position."
            case .valentine:
                return "Borderless, Bottom Padding for Styled Leading Label with Trailing Label and Position."
            case .humble:
                return "Borderless, Bottom Padding with Center-Aligned Vertical Labels and Position."
            case .playroom:
                return "Borderless, Color Fading Bottom with Creative Styled Labels and Position."
            case .niara:
                return "Borderless, Fading Bottom with Padding, Serif Labels and Position."
            case .gaia:
                return "Borderless, Top Padding for Styled Leading Label with Trailing Label and Position."
            }
        }
    }
}

extension ClassicalPrintModel {
    public enum Pallete: Hashable, Identifiable {
        case uniform(Color)
        case pair(background: Color, overlay: Color)

        static let allStyles: [Pallete] = [
            .pair(background: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), overlay: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))),
            .pair(background: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), overlay: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
            .pair(background: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), overlay: Color(#colorLiteral(red: 1, green: 0.8431372549, blue: 0, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.1803921569, green: 0.2823529412, blue: 0.3843137255, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.4470588235, green: 0.137254902, blue: 0.2, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.2392156863, green: 0.7568627451, blue: 0.8862745098, alpha: 1))),
            .pair(background: Color(#colorLiteral(red: 0.8705882353, green: 0.862745098, blue: 0.7333333333, alpha: 1)), overlay: Color(#colorLiteral(red: 0.2431372549, green: 0.7333333333, blue: 0.7058823529, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.9215686275, green: 0.7098039216, blue: 0.7058823529, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.6274509804, green: 0.4235294118, blue: 0.6274509804, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.5490196078, green: 0.8666666667, blue: 0.8862745098, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.9843137255, green: 0.8470588235, blue: 0.7607843137, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.9450980392, green: 0.431372549, blue: 0.4039215686, alpha: 1))),
            .uniform(Color(#colorLiteral(red: 0.1176470588, green: 0.6078431373, blue: 0.6078431373, alpha: 1))),
            .pair(background: Color(#colorLiteral(red: 0.8705882353, green: 0.937254902, blue: 0.9058823529, alpha: 1)), overlay: Color(#colorLiteral(red: 0.937254902, green: 0.8196078431, blue: 0.8117647059, alpha: 1))),
            .pair(background: Color(#colorLiteral(red: 0.6078431373, green: 0.5254901961, blue: 0.4392156863, alpha: 1)), overlay: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
            .pair(background: Color(#colorLiteral(red: 0.6039215686, green: 0.2823529412, blue: 0.137254902, alpha: 1)), overlay: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        ]

        // swiftlint:disable:next identifier_name
        public var id: Int {
            hashValue
        }

        public func hash(into hasher: inout Hasher) {
            switch self {
            case .uniform(let color):
                hasher.combine(color.cgColor)
            case .pair(let background, let overlay):
                hasher.combine(background.cgColor?.components)
                hasher.combine(overlay.cgColor?.components)
            }
        }
    }
}

let demoClassicalPrints = [
    ClassicalPrintModel(),
    ClassicalPrintModel(size: .w11h17, orientation: .portait),
    ClassicalPrintModel(size: .w18h24, orientation: .portait),
    ClassicalPrintModel(size: .w24h36, orientation: .portait)
]
