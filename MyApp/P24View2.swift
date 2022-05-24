//
//  P24Wrapper.swift
//  IosAppWrapper
//
//  Created by Pawel Wegrzynski on 24/05/2022.
//

import Foundation
import SwiftUI
import P24

final class P24View2: NSObject, UIViewControllerRepresentable, P24TransferDelegate {
    let merchantId = Int32(64195)
    
    func makeUIViewController(context: Context) -> UIViewController{
        let controller = UIViewController()
        let params = P24TrnDirectParams.init(transactionParams: getTransactionParams())!
        params.sandbox = true
        P24.startTrnDirect(params, in: controller, delegate: self)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        print("updateUIViewController ")
    }
    
    func sessionId() -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
        var sId = "";
        
        for _ in 0...25 {
            let r = (Int) (arc4random() % 62);
            
            let c = alphabet[alphabet.index(alphabet.startIndex, offsetBy: r)];
            sId.append(c);
        }
        
        print("Session id: %@", sId);
        return sId;
    }
    
    func getCrc() -> String {
        return "d27e4cb580e9bbfe"
    }
    
    func getTransactionParams() -> P24TransactionParams {
    
        let transaction = P24TransactionParams()
        transaction.merchantId = merchantId
        transaction.crc = getCrc()
        transaction.sessionId = sessionId()
        transaction.address = "Test street"
        transaction.amount = 1
        transaction.city = "Poznań"
        transaction.zip = "61-600"
        transaction.client = "John Smith"
        transaction.country = "PL"
        transaction.language = "pl"
        transaction.currency = "PLN"
        transaction.email = "test124@test.pl"
        transaction.phone = "1223134134"
        transaction.desc = "description"
//        transaction.method = 181;
        
        return transaction
    }
    
    // MARK: P24TransferDeleagate
    func p24TransferOnSuccess() {
        print("Transaction success")
    }
    
    func p24TransferOnCanceled() {
        print("Transaction cancelled")
    }
    
    func p24Transfer(onError errorCode: String!) {
        print("Transaction error" + errorCode)
    }
}

struct P24View2_Previews: PreviewProvider {
    static var previews: some View {
        P24View2()
    }
}
