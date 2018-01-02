//
//  Login Interactor.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import Foundation

//Firebase должен быть импортировать только в файл interactor'a!!!
import Firebase
import FirebaseAuth

class LoginInteractor: LoginPresenterToInteractorProtocol {
    
    var presenter: LoginInteractorToPresenterProtocol?
    
    func authorize(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                let error = error! as NSError
                self.presenter?.authorizationFailed(error: error)
                return
            }
            DispatchQueue.main.async {
                print("бля, походу залогинился")
            }
        }
        
    }
    
    
}
