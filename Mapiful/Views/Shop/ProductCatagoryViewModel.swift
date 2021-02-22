//
//  CatalogViewModel.swift
//  Mapiful
//
//  Created by Peter Larson on 2/21/21.
//

import SwiftUI

struct ProductCatagoryViewModel {
    let name, description: String
    let image: Image
    let actions: [Action]
    
    struct Action: Hashable {
        static func == (lhs: ProductCatagoryViewModel.Action, rhs: ProductCatagoryViewModel.Action) -> Bool {
            lhs.button == rhs.button
        }
        
        let view: AnyView
        let button: ActionButtonModel
        
        init(_ view: AnyView, button: ActionButtonModel? = nil) {
            self.view = view
            self.button = button ?? .design
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(button)
        }
    }
    
    enum ActionButtonModel: Hashable {
        case label(String)
        case blinky(String)
        case captionedIcon(image: Image, caption: String)
        
        static let design = ActionButtonModel.blinky("Design your own")
        
        var view: ActionButton {
            switch self {
                case let .label(label):
                    return ActionButton(label: label, blinky: false)
                case let .blinky(label):
                    return ActionButton(label: label, blinky: true)
                case let .captionedIcon(image, caption):
                    return ActionButton(icon: image, caption: caption)
            }
        }
        
        func hash(into hasher: inout Hasher) {
            switch self {
                case let .blinky(label):
                    hasher.combine(label)
                case let .label(label):
                    hasher.combine(label)
                case let .captionedIcon(image: _, caption: caption):
                    hasher.combine(caption)
            }
        }
    }
}

let products: [ProductCatagoryViewModel] = [
    ProductCatagoryViewModel(
        name: "Classic Mapiful",
        description: "Our original, all-time community favorite. Custom prints of the places closest to your heart. Choose anywhere in the world.",
        image: Image("classic mapiful catalog"),
        actions: [
            ProductCatagoryViewModel.Action(AnyView(Color.red))
        ]
    ),
    ProductCatagoryViewModel(
        name: "Star Mapiful",
        description: "Remeber the nights. Get what was written in the stars at any given location and given date.",
        image: Image("star mapiful catalog"),
        actions: [
            ProductCatagoryViewModel.Action(AnyView(EmptyView()))
        ]
    ),
    ProductCatagoryViewModel(
        name: "Zodiac Mapiful",
        description: "Into astrology? Embrace what is already written in the stars with these high quality prints.",
        image: Image("zodiac mapiful catalog"),
        actions: [
            ProductCatagoryViewModel.Action(AnyView(EmptyView()))
        ]
    ),
    ProductCatagoryViewModel(
        name: "Text Art Mapiful",
        description: "Your own photos and words, turned into a piece of art. Make a print out of your favorite memory.",
        image: Image("text art mapiful catalog"),
        actions: [
            ProductCatagoryViewModel.Action(AnyView(EmptyView()))
        ]
    ),
    ProductCatagoryViewModel(
        name: "Frames & Hangers",
        description: "The perfect way to get your print on your wall. Pin it up beatifully with one of hangers or frames.",
        image: Image("frames"),
        actions: [
            ProductCatagoryViewModel.Action(
                AnyView(EmptyView()),
                button: .label("Shop Frames")
            ),
            ProductCatagoryViewModel.Action(
                AnyView(EmptyView()),
                button: .label("Shop Hangers")
            ),
        ]
    )
]
