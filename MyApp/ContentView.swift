//
//  ContentView.swift
//  MyApp
//
//  Created by Pawel Wegrzynski on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var startTransaction = false

    var body: some View {
        VStack {
            
            P24View(startTransaction: $startTransaction)
                       
            Button(action: { startTransaction.toggle() }) {
                if startTransaction {
                    Text("Stop tx")
                } else {
                    Text("Start tx")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
