//
//  ContentView.swift
//  MyApp
//
//  Created by Pawel Wegrzynski on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()

            Button("Select Image") {
               showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            P24View()
        }
    }
//        Text("Hello, world!")
//            .padding()

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
