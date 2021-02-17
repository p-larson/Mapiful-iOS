//
//  Button+.swift
//  Mapiful
//
//  Created by Peter Larson on 11/17/20.
//

import SwiftUI
import Haptica

public struct OptionButtonStyle: ButtonStyle {

    let selected: Bool

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .blur(radius: configuration.isPressed ? 0.3 : 0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .padding(selected ? 4 : 0)
            .background(
                ZStack {
                    Capsule(style: .continuous)
                        .fill(Color.black)
                    Capsule(style: .continuous)
                        .fill(Color.white)
                        .padding(selected ? 2 : 0)
                }
            )
            .scaleEffect(selected ? 1 : 3 / 4)
            .onChange(of: configuration.isPressed, perform: { _ in
                if configuration.isPressed {
                    Haptic.impact(.medium).generate()
                }
            })
    }
}

struct CompleteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(
                Capsule(style: .continuous)
                    .fill(Color.selected)
            )
            .padding(.horizontal, 20)
            .font(
                .system(
                    size: 18,
                    weight: Font.Weight.bold,
                    design: Font.Design.rounded
                )
            )
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .blur(radius: configuration.isPressed ? 0.3 : 0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .onChange(of: configuration.isPressed, perform: { _ in
                if configuration.isPressed {
                    Haptic.impact(.medium).generate()
                }
            })
    }
}

struct BasicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(
                Capsule(style: .continuous)
                    .fill(Color.label)
            )
            .font(
                .system(
                    size: 14,
                    weight: Font.Weight.bold,
                    design: Font.Design.rounded
                )
            )
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .blur(radius: configuration.isPressed ? 0.3 : 0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .onChange(of: configuration.isPressed, perform: { _ in
                if configuration.isPressed {
                    Haptic.impact(.medium).generate()
                }
            })
    }
}

struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 20, height: 20)
            .aspectRatio(1, contentMode: .fit)
            .foregroundColor(.label)
            .padding(8)
            .background(
                Capsule(style: .continuous)
                    .fill(Color.background)
            )
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .blur(radius: configuration.isPressed ? 0.3 : 0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .onChange(of: configuration.isPressed, perform: { _ in
                if configuration.isPressed {
                    Haptic.impact(.light).generate()
                }
            })
    }
}

struct PickerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Image(systemName: "chevron.down")
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .background(
            Capsule(style: .continuous)
                .stroke(Color.label, lineWidth: 2)
        )
        .foregroundColor(.label)
        .opacity(configuration.isPressed ? 0.5 : 1.0)
        .blur(radius: configuration.isPressed ? 0.3 : 0)
        .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
        .onChange(of: configuration.isPressed, perform: { _ in
            if configuration.isPressed {
                Haptic.impact(.light).generate()
            }
        })
    }
}

struct ButtonDemoView: View {

    @State private var button1 = 1

    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text("Button")
            })
            .buttonStyle(BasicButtonStyle())

            Button(action: {}, label: {
                Text("Edit and Continue")
            })
            .buttonStyle(CompleteButtonStyle())

            Button(action: {
                self.button1 = Int.random(in: 0 ..< 3)
            }, label: {
                Capsule(style: .continuous)
                    .fill(Color.orange)
            })
            .buttonStyle(OptionButtonStyle(selected: button1 == 1))
            .aspectRatio(1.0, contentMode: .fit)
            .frame(height: 40)

            Button(action: {
                self.button1 = Int.random(in: 0 ..< 3)
            }, label: {
                Capsule(style: .continuous)
                    .fill(Color.green)
            })
            .buttonStyle(OptionButtonStyle(selected: button1 == 2))
            .aspectRatio(1.0, contentMode: .fit)
            .frame(height: 40)

            Button(action: {}, label: {
                Image(systemName: "mappin")
            })
            .buttonStyle(MenuButtonStyle())

            Button(action: {}, label: {
                Text(ClassicalPrintModel.Format.all.first!)
            })
            .buttonStyle(PickerButtonStyle())

            Button(action: {}, label: {
                Text(ClassicalPrintModel.Orientation.portait.rawValue)
            })
            .buttonStyle(OptionButtonStyle(selected: true))
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemoView()
    }
}
