//
//  ActionButton.swift
//  Mapiful
//
//  Created by Peter Larson on 2/10/21.
//

// Peter Larson

import SwiftUI

struct ActionButton: View {
    let icon: Image?
    let label: String
    let blinky: Bool
    // State
    @State private var animating = false
    
    public init(
        label: String,
        blinky: Bool = true
    ) {
        self.icon = nil
        self.label = label
        self.blinky = blinky
    }
    
    public init(
        icon: Image? = nil,
        caption: String,
        blinky: Bool = true
    ) {
        self.icon = icon
        self.label = caption
        self.blinky = blinky
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            // Outline
            Capsule(style: .circular)
                .fill(Color.action)
                .padding(animating ? -10 : 0)
                .brightness(animating ? 1 : 0)
                .opacity(animating ? 0 : 1)
                .onAppear {
                    
                    guard blinky else {
                        return
                    }
                    
                    DispatchQueue.main.async { // Fuck you NavigationView.
                        withAnimation(
                            Animation
                                .linear(duration: 1)
                                .delay(2)
                                .repeatForever(autoreverses: false)
                        ) {
                            self.animating.toggle()
                        }
                    }
                }
            // Background
            Capsule(style: .circular)
                .fill(Color.action)
            // Label
            HStack {
                icon?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                Text(label)
                    .font(.system(Font.TextStyle.body, design: Font.Design.default))
                    .fontWeight(.heavy)
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 45)
    }
}

struct ActionButton_Previews: PreviewProvider {
    
    static var demoview: some View {
        VStack(spacing: 20) {
            ActionButton(icon: Image(systemName: "square.and.pencil"), caption: "Design")
            ActionButton(label: "Design your own")
        }
        .padding(.horizontal)
    }
    
    static var previews: some View {
        Group {
            // WORKING DEMONSTRATION
            // View's animation working as intended.
            demoview
                .previewDevice("iPhone 12")
                .previewDisplayName("Intended Animation Result")
            
            // BROKEN DEMONSTRATION
            // The only change is the view is wrapped in a NavigationView.
            // Suddenly the view is all over the place and doing a scale transition or animation?
            // Even though I don't have any transitions on or extra animations.
            // I've stared at this for too long, thank you for taking the time to look at this.
            // Hopefully some new eyes on this will help resolve this weird issue.
            NavigationView {
                demoview
            }
            .previewDisplayName("(NavigationView) Unexplained animation")
            .previewDevice("iPhone12")
            
            // Is it just that NavigationView is evil? Is that it?
        }
    }
}
