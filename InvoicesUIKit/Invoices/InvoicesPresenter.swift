//
//  InvoincesPresenter.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 19/9/22.
//

import Foundation

protocol InvoicesPresenterDelegate {
    func sendInvoices(invoices: [Invoice])
}


class InvoicesPresenter {
    var myInvoices: [Invoice] = []
    var delegate: InvoicesPresenterDelegate?
    var coordinator : AppCoordinator?
    
    func getInvoices(){
        if coordinator?.filterVC.filterPresenter.filterValues == nil {
        getAllInvoices()
    } else {
        InvoiceApi.getRemoteInvoices { (result) in
            switch result {
            case .failure(let error):
                print (error)
            case .success(let invoices):
                print(invoices)
                DispatchQueue.main.async {
                    self.myInvoices.removeAll()
                    for invoice in invoices {
                        for status in self.coordinator!.filterVC.statusObject where status.selected == true && invoice.status == status.status{
                                self.myInvoices.append(invoice)
                        }
                    }
                    self.filterInvoices(invoicesIn: self.myInvoices)
                    self.delegate?.sendInvoices(invoices: self.myInvoices)
                }
            }
        }
    }
}
    
    func goToFilterPage() {
        coordinator?.goToFilterVC()
    }


func filterInvoices(invoicesIn: [Invoice]) -> [Invoice] {
    let invoicesToFilter = invoicesIn
        .filter{
            $0.amount! <= (coordinator?.filterVC.filterPresenter.filterValues?.amount!)!}
        .filter{
            ($0.date?.getDateFromString(date: $0.date!))! >= (coordinator?.filterVC.filterPresenter.filterValues?.fromDate!)!}
        .filter{
            ($0.date?.getDateFromString(date: $0.date!))! <= (coordinator?.filterVC.filterPresenter.filterValues?.toDate!)!}
    myInvoices = invoicesToFilter
    return myInvoices
}

    
    func getAllInvoices(){
        InvoiceApi.getRemoteInvoices { (result) in
            switch result {
            case .failure(let error):
                print (error)
            case .success(let invoices):
                print(invoices)
                DispatchQueue.main.async {
                    self.myInvoices = invoices
                    self.delegate?.sendInvoices(invoices: invoices)
                }
            }
        }
    }
}
