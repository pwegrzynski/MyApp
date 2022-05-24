//
//  P24.swift
//  MyApp
//
//  Created by Pawel Wegrzynski on 24/05/2022.
//

import SwiftUI
import P24

class P24View2: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> P24ViewController {
        let p24 = P24ViewController()
        print("makeUIViewController ")
        p24.startTrnDirect()
        return p24
    }
    
    func updateUIViewController(_ uiViewController: P24ViewController, context: Context) {
        print("updateUIViewController ")
    }
}

