//
//  InvoicesVC.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 9/8/22.
//

import Foundation
import UIKit


class InvoicesViewController : UIViewController {
    
    var invoicesView = InvoicesView()
    var myInvoices : [Invoice] = []
    var invoicesPresenter = InvoicesPresenter()  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = invoicesView.filterItem
        invoicesView.filterItem.target = self
        invoicesView.filterItem.action = #selector(goToFilterVC)
        view.backgroundColor = .white
        view.addSubview(invoicesView)
        invoicesView.invoicesTableView.dataSource = self
        invoicesView.invoicesTableView.delegate = self
        invoicesView.invoicesTableView.register(InvoiceTableViewCell.self, forCellReuseIdentifier: "InvoiceTableViewCell")
        invoicesPresenter.delegate = self
       
    }
    
    @objc func goToFilterVC() {
        invoicesPresenter.goToFilterPage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        invoicesPresenter.getInvoices()
    }
}
extension InvoicesViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myInvoices.count        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvoiceTableViewCell", for: indexPath) as! InvoiceTableViewCell
        cell.configure(invoice: myInvoices[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }   
}

extension InvoicesViewController: InvoicesPresenterDelegate {
    func sendInvoices(invoices: [Invoice]) {
        myInvoices = invoices
        self.invoicesView.invoicesTableView.reloadData()
    }
}
