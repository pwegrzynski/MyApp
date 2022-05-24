//
//  P24View.swift
//  IosAppWrapper
//
//  Created by Pawel Wegrzynski on 23/05/2022.
//

import SwiftUI
import P24

final class P24ViewController: UIViewController, P24TransferDelegate {
    let merchantId = Int32(64195)
    
//    convenience init(){
//        self.init()
//        startTrnDirect()
//    }
//    
//    required convenience init?(coder: NSCoder) {
//        self.init(coder: coder)
//    }
//    
    func startTrnDirect() {
        let params = P24TrnDirectParams.init(transactionParams: getTransactionParams())!
        params.sandbox = true
        P24.startTrnDirect(params, in: self, delegate: self)
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

