//
//  StringExtension.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 17/8/22.
//

import Foundation

extension String {
    func getDateFromString (date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let myDate = dateFormatter.date(from: date)
        return myDate!
    }
}
