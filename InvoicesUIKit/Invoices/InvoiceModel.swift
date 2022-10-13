//
//  InvoicesModel.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 9/8/22.
//

import Foundation

struct Invoice : Codable {
    let id : Int?
    let status : Status?
    let amount : Float?
    let date : String?
}

enum Status : String, CaseIterable, Codable {
    case pendiente = "Pendiente de pago"
    case pagado = "Pagado"
    case rechazado = "Rechazado"
    case plan = "Plan de pago"
}




