//
//  FilterModel.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 12/8/22.
//

import Foundation

struct FilterValues {
    var fromAmount :Float?
    var toAmount : Float?
    var amount : Float?
    var fromDate : Date?
    var toDate : Date?
    var statusValues : [StatusObject]?
}

struct StatusObject {
    var status: Status?
    var selected: Bool
}
