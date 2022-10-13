//
//  ViewController.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 4/8/22.
//

import UIKit
import Foundation

class FilterViewController: UIViewController {
    
    var statusObject : [StatusObject] = []
    var filterView = FilterView()
    var statusArray = Status.allCases
    var myInvoices : [Invoice] = []
    var statusCells : [StatusTableViewCell] = []
    var filterPresenter = FilterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPresenter.delegate = self
        filterView.statusTableView.dataSource = self
        view.addSubview(filterView)
        view.backgroundColor = .white

        filterView.statusTableView.register(StatusTableViewCell.self, forCellReuseIdentifier: "StatusTableViewCell")
        filterView.slider.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        filterView.aplicarFiltrosButton.addTarget(self, action: #selector(setFilterValues), for: .touchUpInside)
        filterView.eliminarFiltrosButton.addTarget(self, action: #selector(deleteFilterValues), for: .touchUpInside)
        filterPresenter.setValues()
    }
    
    func asignValuesToViews(){
        filterView.slider.minimumValue = (filterPresenter.filterValues?.fromAmount)!
        filterView.slider.maximumValue = (filterPresenter.filterValues?.toAmount)!
        filterView.slider.value = (filterPresenter.filterValues?.amount)!
        filterView.minDatePicker.date = (filterPresenter.filterValues?.fromDate)!
        filterView.maxDatePicker.date = (filterPresenter.filterValues?.toDate)!
        
        self.statusObject = (filterPresenter.filterValues?.statusValues)!
        filterView.statusTableView.reloadData()
        

        filterView.sliderText.text = "\(filterView.slider.value)"
        filterView.sliderText.font = filterView.sliderText.font?.withSize(25)
    }
    
    @objc func changeValue(_ sender : UISlider) {
        let floatValue = sender.value
        let fortmatTwoDecimals = String(format: "%.2f", floatValue)
        filterView.sliderText.text = fortmatTwoDecimals
        
    }
    
    @objc func setFilterValues() {
        filterPresenter.filterValues?.amount = filterView.slider.value
        filterPresenter.filterValues?.fromDate = filterView.minDatePicker.date
        filterPresenter.filterValues?.toDate = filterView.maxDatePicker.date
        filterPresenter.filterValues?.statusValues = statusObject
        
        filterPresenter.goToInvoicesPage()
        dismiss(animated: true)
    }
    
    @objc func deleteFilterValues() {
        filterPresenter.getDefaultValues()
        filterPresenter.goToInvoicesPage()
        dismiss(animated: true)
    }
}

extension FilterViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatusTableViewCell", for: indexPath) as! StatusTableViewCell
        cell.status = statusObject[indexPath.row].status
        cell.checkButton.isSelected = statusObject[indexPath.row].selected
        cell.label.text = cell.status?.rawValue
        cell.delegate = self
        return cell        
    }
}

extension FilterViewController: StatusTableViewCellDelegate {
    func createStatusCheckArray(cell: StatusTableViewCell) {
        cell.checkButton.isSelected.toggle()
        let index = statusObject.firstIndex(where: {$0.status == cell.status})!
        statusObject[index].selected.toggle()
    }
}

extension FilterViewController: FilterPresenterDelegate {
    func sendInvoices(invoices: [Invoice]) {
        self.myInvoices = invoices
        asignValuesToViews()
    }
}


