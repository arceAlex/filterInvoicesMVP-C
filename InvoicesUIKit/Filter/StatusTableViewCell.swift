//
//  MyTableViewCell.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 8/8/22.
//

import Foundation
import UIKit

protocol StatusTableViewCellDelegate {
    func createStatusCheckArray(cell: StatusTableViewCell)
}

class StatusTableViewCell : UITableViewCell {
    
    var delegate: StatusTableViewCellDelegate?
    var status: Status?
    
    let label : UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 5, width: 300, height: 30))
        return label
    }()
    
    var checkButton : UIButton = {
        let checkButton = UIButton(frame: CGRect(x: 0, y: 10, width: 20, height: 20))
        checkButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        checkButton.setBackgroundImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        checkButton.isSelected = true
        checkButton.backgroundColor = .white
        checkButton.addTarget(self, action: #selector(buttonCheck(_:)), for: .touchUpInside)
        return checkButton
    }()
    
    @objc func buttonCheck(_ sender: UIButton) {
        delegate?.createStatusCheckArray(cell: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(checkButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configureLabel(status: Status) {
//        label.text = status.rawValue
//    }
}

//extension StatusTableViewCell : FilterVCDelegate {
//    func statusTableCheck() {
//        checkButton.reloadInputViews()
//    }
//    
//    
//}
