//
//  LoginProtocols.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit
import Firebase

//MARK: - Отношения Presenter'a и View

//Реализует view
protocol LoginPresenterToViewProtocol {
    var presenter: LoginViewToPresenterProtocol? { get set }
    func showViewItemsViewController()
    func showErrorAlert(withErrorDescription description: String)
}

//Реализует presenter
protocol LoginViewToPresenterProtocol {
    var view: LoginPresenterToViewProtocol? { get set }
    
    //запрашиваем роутер здесь, потому что view будет спрашивать presenter, чтобы тот обратился к router'у для создания модуля при переходах
    var router: LoginPresenterToRouterProtocol? { get set }
    //Спрашивает залогиниться
    func login(withEmail email: String, password: String)
}


//MARK: - Отношения Presenter'a и Interactor'a

//Реализует presenter
protocol LoginInteractorToPresenterProtocol {
    var interactor: LoginPresenterToInteractorProtocol? { get set }
    func authorizationSucceeded(name: String)
    func authorizationFailed(error: NSError)
}

//Реализует Interactor
protocol LoginPresenterToInteractorProtocol {
    var presenter: LoginInteractorToPresenterProtocol? { get set }
    //в этом методе должна быть непосредственная работа с Firebase
    func authorize(withEmail email: String, password: String)
}


//MARK: - Presenter to Rounter only
//protocol LoginPresenterPropertyRequirement {
//    var router: LoginPresenterToRouterProtocol? { get set }
//}
protocol LoginPresenterToRouterProtocol {
    func createLoginScene() -> LoginViewController
    //func createRegistrationScene() -> RegistrationViewController
    
    
    //По-моему эти два метода придятся объединить, так как они оба состоят в tabbar controller'e и инициализируются одновременно
    
    func createMainScene() -> UITabBarController
    
    //func createViewItemsScene() -> ViewItemsViewController
    //func createSettingsScene() -> SettingsViewController
}
