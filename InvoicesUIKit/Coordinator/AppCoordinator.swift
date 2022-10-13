//
//  AppCordinator.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 22/9/22.
//

import Foundation
import UIKit

class AppCoordinator {
    let navigationController: UINavigationController
    let invoicesVC = InvoicesViewController()
    let filterVC = FilterViewController()
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
        invoicesVC.invoicesPresenter.coordinator = self
        filterVC.filterPresenter.coordinator = self
    }
    
    func start() {
        goToInvoicesVC()
    }
    
    func goToInvoicesVC() {
        navigationController.pushViewController(invoicesVC, animated: true)
    }
    
    func goToFilterVC() {
        navigationController.pushViewController(filterVC, animated: true)
    }
    
    func returnToInvoicesVC() {
        navigationController.popViewController(animated: true)
    }
}
