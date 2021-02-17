//
//  BookmarkDesignView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

// TODO: Refactor

struct BookmarkDesignView: View {
    @State private var saved = false

    var body: some View {
        Button(action: {
            self.saved.toggle()
        }, label: {
            HStack {
                Text("Save your design for later")
                Spacer()

                if saved {
                    Text("Saved")
                        .italic()
                        .brightness(0.5)
                }

                Image(systemName: saved ? "bookmark.fill" : "bookmark")
            }
            .foregroundColor(.label)
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                Color.background
            )
        })
    }

}

struct BookmarkDesignView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkDesignView()
    }
}
