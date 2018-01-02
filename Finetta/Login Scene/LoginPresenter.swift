//
//  LoginPresenter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import Foundation


class LoginPresenter {
    
    var router: LoginPresenterToRouterProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    var view: LoginPresenterToViewProtocol?
    
    
}

extension LoginPresenter: LoginViewToPresenterProtocol {
    
    func login(withEmail email: String, password: String) {
        self.interactor?.authorize(withEmail: email, password: password)
    }
    
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    func authorizationSucceeded(name: String) {
        
        self.view?.showViewItemsViewController()
    }
    
    func authorizationFailed(error: NSError) {
        
        self.view?.showErrorAlert(withErrorDescription: error.localizedDescription)
        
    }
    
}

