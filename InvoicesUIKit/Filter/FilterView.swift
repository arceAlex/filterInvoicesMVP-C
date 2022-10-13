//
//  FilterView.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 4/8/22.
//

import Foundation
import UIKit

class FilterView : UIView {

    // Title
    var title : UILabel = {
        let title = UILabel(frame: CGRect(x: 30, y: 100, width: 700, height: 40))
        title.text = "Filtrar Facturas"
        title.font = UIFont(name: title.font.fontName, size: 39)
        return title
    }()
    
    //Date Title
    var dateTitle : UILabel = {
        let dateTitle = UILabel(frame: CGRect(x: 30, y: 150, width: 700, height: 20))
        dateTitle.text = "Con fecha de emisión"
        dateTitle.font = UIFont(name: dateTitle.font.fontName, size: 20)
        return dateTitle
    }()
    
    //Desde - Hasta label
    var desdeLabel : UILabel = {
        let desdeLabel = UILabel(frame: CGRect(x: 30, y: 180, width: 100, height: 20))
        desdeLabel.text = "Desde"
        return desdeLabel
    }()
    
    var hastaLabel : UILabel = {
        let hastaLabel = UILabel(frame: CGRect(x: 200, y: 180, width: 200, height: 20))
        hastaLabel.text = "Hasta"
        return hastaLabel
    }()
    
    //Date Pickers
    var minDatePicker : UIDatePicker = {
        let minDatePicker = UIDatePicker(frame: CGRect(x: -85, y: 210, width: 100, height: 30))
        minDatePicker.datePickerMode = .date
        return minDatePicker
    }()
    
    var maxDatePicker : UIDatePicker = {
        let maxDatePicker = UIDatePicker(frame: CGRect(x: 85, y: 210, width: 30, height: 30))
        maxDatePicker.datePickerMode = .date
        return maxDatePicker
    }()
    
    //Slider
    let slider : UISlider = {
        let slider = UISlider(frame: CGRect(x: 50, y: 300, width: 260, height: 30))
        return slider
    }()
    
    let sliderText : UITextView = {
        let sliderText = UITextView(frame: CGRect(x: 150, y: 250, width: 150, height: 50))
        return sliderText
    }()
    
    //Status TableView
    var statusTableView : UITableView = {
        let statusTableView = UITableView(frame: CGRect(x: 30, y: 550, width: 300, height: 180))
        statusTableView.backgroundColor = .white
        statusTableView.allowsSelection = false
        statusTableView.separatorStyle = .none
        return statusTableView
    }()
    
    // Aplicar y Eliminar filtros
    
    let aplicarFiltrosButton : UIButton = {
        let aplicarFiltrosButton = UIButton()
        aplicarFiltrosButton.setTitle("Aplicar", for: .normal)
        aplicarFiltrosButton.translatesAutoresizingMaskIntoConstraints = false
        aplicarFiltrosButton.setTitleColor(.systemBlue, for: .normal)
        return aplicarFiltrosButton
    }()
    
    let eliminarFiltrosButton : UIButton = {
        let eliminarFiltrosButton = UIButton()
        eliminarFiltrosButton.setTitle("Eliminar Filtros", for: .normal)
        eliminarFiltrosButton.translatesAutoresizingMaskIntoConstraints = false
        eliminarFiltrosButton.setTitleColor(.systemBlue, for: .normal)
        return eliminarFiltrosButton
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        config()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        self.addSubview(title)
        self.addSubview(dateTitle)
        self.addSubview(desdeLabel)
        self.addSubview(hastaLabel)
        self.addSubview(maxDatePicker)
        self.addSubview(minDatePicker)
        self.addSubview(slider)
        self.addSubview(sliderText)
        self.addSubview(statusTableView)
        self.addSubview(aplicarFiltrosButton)
        self.addSubview(eliminarFiltrosButton)
        setConstraints()
    }
    
    func setConstraints() {
        aplicarFiltrosButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        aplicarFiltrosButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        aplicarFiltrosButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        aplicarFiltrosButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        eliminarFiltrosButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        eliminarFiltrosButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        eliminarFiltrosButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        eliminarFiltrosButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    
}
