//
//  ThemeOptionView.swift
//  Mapiful
//
//  Created by Peter Larson on 11/23/20.
//

import SwiftUI

// TODO: Have a graphic designer create an icon for each Format.
// Not saying this is the worst route, but a graphic designer could make
// this look a lot bit better with custom icons.

struct FormatOptionView: View {

    let format: ClassicalPrintModel.Format
    
    var body: some View {
        switch format {
        case .modern:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                        .mask(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.black, Color.clear]
                                ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    Rectangle()
                        .strokeBorder(lineWidth: 1)
                    Rectangle()
                        .strokeBorder(lineWidth: 2)
                        .padding(3)
                    VStack(spacing: 2) {
                        Text("A")
                            .font(
                                .system(
                                    size: 12,
                                    weight: Font.Weight.black,
                                    design: Font.Design.rounded
                                )
                            )
                        HStack(spacing: 4) {
                            Rectangle()
                                .frame(width: 8, height: 2)
                            Text("B")
                                .font(
                                    .system(
                                        size: 10,
                                        weight: Font.Weight.semibold,
                                        design: Font.Design.rounded
                                    )
                                )
                            Rectangle()
                                .frame(width: 8, height: 2)
                        }
                        Text("C")

                            .font(
                                .system(
                                    size: 8,
                                    weight: Font.Weight.ultraLight,
                                    design: Font.Design.serif
                                )
                            )
                    }
                }
                .foregroundColor(.label)
            )
        case .legend:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                    VStack(spacing: 2) {
                        Text("A")
                            .font(
                                .system(
                                    size: 12,
                                    weight: Font.Weight.black,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("B")
                            .font(
                                .system(
                                    size: 10,
                                    weight: Font.Weight.semibold,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("C")

                            .font(
                                .system(
                                    size: 8,
                                    weight: Font.Weight.ultraLight,
                                    design: Font.Design.serif
                                )
                            )
                    }
                    .foregroundColor(.label)
                }
            )
        case .pantone:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("A")
                            .font(
                                .system(
                                    size: 12,
                                    weight: Font.Weight.black,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("B")
                            .font(
                                .system(
                                    size: 10,
                                    weight: Font.Weight.semibold,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("C")

                            .font(
                                .system(
                                    size: 8,
                                    weight: Font.Weight.ultraLight,
                                    design: Font.Design.serif
                                )
                            )
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.label)
                }
            )
        case .smooth:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                        .mask(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.black, Color.clear]
                                ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    VStack(spacing: 2) {
                        Text("A")
                            .font(
                                .system(
                                    size: 12,
                                    weight: Font.Weight.black,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("B")
                            .font(
                                .system(
                                    size: 10,
                                    weight: Font.Weight.semibold,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("C")

                            .font(
                                .system(
                                    size: 8,
                                    weight: Font.Weight.ultraLight,
                                    design: Font.Design.serif
                                )
                            )
                    }
                }
                .foregroundColor(.label)
            )
        case .valentine:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                    VStack(spacing: 0) {
                        Color.label
                            .padding(4)
                        HStack {
                            Text("A")
                                .font(
                                    .custom("Bradley Hand", size: 14)
                                )
                            Spacer()
                            VStack(spacing: 2) {
                                Text("B")
                                    .font(
                                        .system(
                                            size: 10,
                                            weight: Font.Weight.semibold,
                                            design: Font.Design.rounded
                                        )
                                )

                                Text("C")
                                    .font(
                                        .system(
                                            size: 8,
                                            weight: Font.Weight.ultraLight,
                                            design: Font.Design.serif
                                        )
                                    )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            )
        case .humble:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                    VStack(spacing: 2) {
                        Text("A")
                            .font(
                                .custom("Bradley Hand", size: 14)
                            )
                        Text("B")
                            .font(
                                .system(
                                    size: 10,
                                    weight: Font.Weight.semibold,
                                    design: Font.Design.rounded
                                )
                        )

                        Text("C")
                            .font(
                                .system(
                                    size: 8,
                                    weight: Font.Weight.ultraLight,
                                    design: Font.Design.serif
                                )
                            )
                    }
                    .padding()
                }
            )
        case .playroom:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.clear, Color.action.opacity(0.25)]
                                ),
                                startPoint: .center,
                                endPoint: .bottom
                            )
                        )
                    VStack(spacing: 2) {
                        Text("A")
                            .font(
                                .system(
                                    size: 12,
                                    weight: Font.Weight.black,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("B")
                            .font(
                                .system(
                                    size: 10,
                                    weight: Font.Weight.bold,
                                    design: Font.Design.rounded
                                )
                            )
                        Text("C")

                            .font(
                                .system(
                                    size: 8,
                                    weight: Font.Weight.ultraLight,
                                    design: Font.Design.serif
                                )
                            )
                    }
                }
                .foregroundColor(.label)
            )
        case .niara:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                        .mask(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.black, Color.clear]
                                ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    VStack(spacing: 2) {
                        Text("A")
                            .font(
                                .system(
                                    size: 12,
                                    weight: Font.Weight.medium,
                                    design: Font.Design.serif
                                )
                            )
                        Text("B")
                            .font(
                                .system(
                                    size: 10,
                                    weight: Font.Weight.thin,
                                    design: Font.Design.serif
                                )
                            )
                        Text("C")

                            .font(
                                .system(
                                    size: 8,
                                    weight: Font.Weight.ultraLight,
                                    design: Font.Design.serif
                                )
                            )
                    }
                }
                .foregroundColor(.label)
            )
        case .gaia:
            AnyView(
                ZStack {
                    Rectangle()
                        .foregroundColor(.background)
                    VStack(spacing: 0) {
                        HStack {
                            Text("A")
                                .font(
                                    .custom("Bradley Hand", size: 14)
                                )
                            Spacer()
                            VStack(spacing: 2) {
                                Text("B")
                                    .font(
                                        .system(
                                            size: 10,
                                            weight: Font.Weight.semibold,
                                            design: Font.Design.rounded
                                        )
                                )

                                Text("C")
                                    .font(
                                        .system(
                                            size: 8,
                                            weight: Font.Weight.ultraLight,
                                            design: Font.Design.serif
                                        )
                                    )
                            }
                        }
                        .padding(.horizontal)

                        Color.label
                            .padding(4)
                    }
                }
            )
        }
    }
}

struct FormatThemeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(ClassicalPrintModel.Format.allCases, id: \.self) { format in
                FormatOptionView(format: format)
                    .frame(width: 60, height: 60)
                    .clipped()
            }
        }
    }
}
