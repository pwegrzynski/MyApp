//
//  P24Wrapper.swift
//  IosAppWrapper
//
//  Created by Pawel Wegrzynski on 24/05/2022.
//

import Foundation
import SwiftUI

struct P24View: UIViewControllerRepresentable {
    @Binding var startTransaction: Bool;
    
    func makeUIViewController(context: Context) -> P24ViewController {
        let p24 = P24ViewController()
        print("makeUIViewController ")
        return p24
    }
    
    func updateUIViewController(_ uiViewController: P24ViewController, context: Context) {
        print("updateUIViewController ")
        if (startTransaction) {
            print("Start transaction")
            uiViewController.startTrnDirect()
        }
    }
}

struct P24View_Previews: PreviewProvider {

    static var previews: some View {
        P24View(startTransaction: .constant(false))
    }
}
