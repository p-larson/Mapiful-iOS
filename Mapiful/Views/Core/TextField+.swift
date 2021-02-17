//
//  Searchbar.swift
//  Mapiful
//
//  Created by Peter Larson on 11/20/20.
//

import SwiftUI

// swiftlint:disable identifier_name

struct SearchBarTextFieldStyle: ViewModifier {

    private let padding: Bool, color: Color

    init(padding: Bool = true, color: Color = .label) {
        self.padding = padding
        self.color = color
    }

    func body(content: Content) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
            content
                .frame(maxWidth: .infinity)
                .foregroundColor(color)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(
            Capsule(style: .continuous)
                .fill(Color.background)
        )
        .padding(.horizontal, padding ? 20 : 0)
    }
}

struct SearchTextFieldStyle: TextFieldStyle {

    private let padding: Bool, color: Color

    init(padding: Bool = true, color: Color = .label) {
        self.padding = padding
        self.color = color
    }

    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
            configuration
                .frame(maxWidth: .infinity)
                .foregroundColor(color)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(
            Capsule(style: .continuous)
                .fill(Color.background)
        )
        .padding(.horizontal, padding ? 20 : 0)
    }
}

struct BasicTextFieldStyle: TextFieldStyle {

    private let padding: Bool, color: Color

    init(padding: Bool = true, color: Color = .label) {
        self.padding = padding
        self.color = color
    }

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(
                Capsule(style: .continuous)
                    .fill(Color.background)
            )
            .padding(.horizontal, padding ? 20 : 0)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextField("Enter a city or a place here", text: .constant("Austin, Texas"))
                .textFieldStyle(SearchTextFieldStyle())
            HStack {
                TextField("Latitude", text: .constant(String()))
                TextField("Latitude", text: .constant(String()))
            }
            .textFieldStyle(BasicTextFieldStyle(padding: false))
            .padding(.horizontal, 20)
        }
    }
}

// swiftlint:enable identifier_name
