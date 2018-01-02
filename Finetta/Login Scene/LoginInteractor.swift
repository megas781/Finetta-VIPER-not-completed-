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

class LoginInteractor: LoginInteractorInterfaceForPresenterProtocol {
    
    weak var presenter: LoginPresenterInterfaceForInteractorProtocol?
    
    func authorize(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                let error = error! as NSError
                self.presenter?.authorizationFailed(error: error)
                return
            
            }
            
            guard let user = user else {
                self.presenter?.authorizationFailed(error: NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"User is equal to nil"]))
                return
            }
            
            //Здесь мы знаем, что авторизация прошла успешно
            
            self.presenter?.authorizationSucceeded(name: user.email!)
            
        }
        
    }
    
    func getUser() -> User? {
        return Auth.auth().currentUser
    }
    
    init() {
        print("login interactor init")
    }
    
    deinit {
        print("login interactor deinit")
    }
    
}
