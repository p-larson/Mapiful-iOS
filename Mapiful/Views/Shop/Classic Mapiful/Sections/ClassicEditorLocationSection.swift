//
//  ClassicEditorLocationView.swift
//  Mapiful
//
//  Created by Peter Larson on 2/17/21.
//

import SwiftUI

struct ClassicEditorLocationSection: View {
    @EnvironmentObject var model: ClassicalPrintModel
    
    @State var address = String()
    @State var longitude = String()
    @State var latitude = String()
    
    func search() {
        // Do something with the address.
        // Then update the longitude/latitude of the map.
        // model.location
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Choose Location")

            TextField("Enter a city or a place here", text: $address, onCommit: search)
                .modifier(SearchBarTextFieldStyle())

            Text("Or use your Current Location")
            
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "pin")
                })
                .buttonStyle(BasicButtonStyle())

                TextField("Longitude", text: $longitude)
                    //.textFieldStyle(BasicTextFieldStyle(padding: false, color: longitudeParsed == nil ? .red : .basic))
                TextField("Latitude", text: $latitude)
                    //.textFieldStyle(BasicTextFieldStyle(padding: false, color: latitudeParsed == nil ? .red : .basic))
            }
            .keyboardType(.numbersAndPunctuation)
            .padding(.horizontal, 20)

            Divider()
        }
        .id("location")
    }
}

struct ClassicEditorLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicEditorLocationSection()
    }
}
