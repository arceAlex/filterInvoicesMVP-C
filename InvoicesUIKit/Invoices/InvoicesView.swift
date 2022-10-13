//
//  InvoicesView.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 9/8/22.
//

import Foundation
import UIKit

class InvoicesView : UIView {
    
    var invoicesTableView : UITableView = {
        let invoicesTableView = UITableView()
        invoicesTableView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        invoicesTableView.allowsSelection = false
        return invoicesTableView
    }()
    
    var filterItem : UIBarButtonItem = {
        var filterItem = UIBarButtonItem()
        filterItem.tintColor = .red
        filterItem.style = .plain
        filterItem.image = UIImage(systemName: "slider.vertical.3")
        return filterItem
    }()    
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        config()
    }
    
    func config() {
        self.addSubview(invoicesTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
