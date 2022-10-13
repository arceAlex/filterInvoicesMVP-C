//
//  FilterPresenter.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 19/9/22.
//

import Foundation

protocol FilterPresenterDelegate {
    func sendInvoices(invoices: [Invoice])
}

class FilterPresenter {
    var delegate : FilterPresenterDelegate?
    var myInvoices : [Invoice] = []
    var filterValues : FilterValues?
    var statusArray = Status.allCases
    var coordinator : AppCoordinator?
    
    func setValues() {
        guard let filterValues = self.filterValues else {
            setDefaultValues()
            return
        }
    }
    
    func getDefaultValues() {
        
        filterValues = FilterValues()
        filterValues?.fromDate = getArrayDatesFormatted().min()!
        filterValues?.toDate = getArrayDatesFormatted().max()!
        filterValues?.fromAmount = getArrayAmounts().min()!
        filterValues?.toAmount = getArrayAmounts().max()!
        filterValues?.amount = getArrayAmounts().max()!
        filterValues?.statusValues = []
        for status in statusArray {
            filterValues?.statusValues?.append(StatusObject(status: status, selected: true))
        }
        self.delegate?.sendInvoices(invoices: myInvoices)
    }
    
    func setDefaultValues(){
        InvoiceApi.getRemoteInvoices { (result) in
            switch result {
            case .failure(let error):
                print (error)
            case .success(let invoices):
                print(invoices)
                DispatchQueue.main.async {
                    self.myInvoices  = invoices
                    self.getDefaultValues()
                }
            }
        }
    }
    
    func goToInvoicesPage() {
        coordinator?.returnToInvoicesVC()
    }
    
    func getArrayAmounts () -> [Float] {
        var amounts = [Float]()
        myInvoices.forEach {
            amounts.append($0.amount!)
        }
        return amounts
    }
    
    func getArrayDatesFormatted () -> [Date] {
        var arrayDatesFormatted : [Date] = []
        myInvoices.forEach {
            arrayDatesFormatted.append(($0.date?.getDateFromString(date: $0.date!))!)
        }
        return arrayDatesFormatted
    }
}

