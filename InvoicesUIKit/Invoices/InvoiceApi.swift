//
//  InvoicesAPI.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 9/8/22.
//

import Foundation

class InvoiceApi {
    enum InvoiceError : Error {
        case missingData
    }
    static func getRemoteInvoices(completion: @escaping(Result<[Invoice],Error>)-> Void) {
        let url = URL(string: "http://localhost:3000/invoices")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(InvoiceError.missingData))
                return
            }
            do {
                let invoices = try JSONDecoder().decode([Invoice].self, from: data)
                completion(.success(invoices))
                return
            } catch let error {
                completion(.failure(error))
                return
            }
        }.resume()
    }
    
    
//    static func getRemoteInvoicesB(completion: @escaping(Result<[InvoiceB],Error>)-> Void) {
//        let url = URL(string: "http://localhost:3000/invoices")!
//        URLSession.shared.dataTask(with: url) {(data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(InvoiceError.missingData))
//                return
//            }
//            do {
//                let invoices = try JSONDecoder().decode([InvoiceB].self, from: data)
//                completion(.success(invoices))
//                return
//            } catch let error {
//                completion(.failure(error))
//                return
//            }
//        }.resume()
//    }
//    static func getInvoice() -> [Invoice] {
//        let invoices = [
//            Invoice(status: .pendiente, amount: 56.76, date: "02/05/22"),
//            Invoice(status: .pagado, amount: 44.69, date: "03/08/21"),
//            Invoice(status: .rechazado, amount: 8.96, date: "04/06/21"),
//            Invoice(status: .plan, amount: 79.65, date: "26/05/21"),
//            Invoice(status: .rechazado, amount: 145.88, date: "03/10/20"),
//            Invoice(status: .plan, amount: 110.23, date: "05/07/19"),
//            Invoice(status: .pagado, amount: 66.1, date: "08/02/19")
//        ]
//        return invoices
//    }
}
