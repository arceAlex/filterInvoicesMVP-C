//
//  InvoiceTableViewCell.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 9/8/22.
//

import Foundation
import UIKit

class InvoiceTableViewCell : UITableViewCell {
    
    let statusLablel : UILabel = {
        let statusLablel = UILabel()
        statusLablel.frame = CGRect(x: 20, y: 10, width: 200, height: 20)
        statusLablel.textColor = .red
        return statusLablel
    }()
    
    let datelabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.frame = CGRect(x: 20, y:40, width: 200, height: 20)
        return dateLabel
    }()
    
    let amountlabel : UILabel = {
        let amountLabel = UILabel()
        amountLabel.frame = CGRect(x: 250, y:28, width: 200, height: 20)
        return amountLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(amountlabel)
        addSubview(datelabel)
        addSubview(statusLablel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    func configure(invoice : Invoice) {
        statusLablel.text = invoice.status?.rawValue
        datelabel.text = invoice.date
        amountlabel.text = "\(invoice.amount!) €"
    }
    
}
