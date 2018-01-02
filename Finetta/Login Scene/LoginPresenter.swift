//
//  LoginPresenter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import Foundation


class LoginPresenter: LoginPresenterPropertyProtocol {
    
    var wireframe: LoginWireframeInterface?
    var interactor: LoginInteractorInterfaceForPresenterProtocol?
    weak var view: LoginViewInterfaceForPresenterProtocol?
    
    init() {
        print("login presenter init")
    }
    deinit {
        print("login presenter deinit")
    }
}

extension LoginPresenter: LoginPresenterInferfaceForViewProtocol {
    
    func login(withEmail email: String, password: String) {
        self.interactor?.authorize(withEmail: email, password: password)
    }
    
}

extension LoginPresenter: LoginPresenterInterfaceForInteractorProtocol {
    func authorizationSucceeded(name: String) {
        
//        self.wireframe.
        
    }
    
    func authorizationFailed(error: NSError) {
        
        self.view?.showErrorAlert(withErrorDescription: error.localizedDescription)
        
    }
    
}

