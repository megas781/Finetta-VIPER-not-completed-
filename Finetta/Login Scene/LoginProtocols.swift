//
//  LoginProtocols.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit
import Firebase

//Протоколы свойств
protocol LoginPresenterPropertyProtocol: class {
    weak var view: LoginViewInterfaceForPresenterProtocol? { get set }
    var wireframe: LoginWireframeInterface? { get set }
    var interactor: LoginInteractorInterfaceForPresenterProtocol? { get set }
}
protocol LoginViewPropertyProtocol: class {
    var presenter: LoginPresenterInferfaceForViewProtocol? { get set }
}
protocol LoginInteractorPropertyProtocol: class {
    weak var presenter: LoginPresenterInterfaceForInteractorProtocol? { get set }
}

//MARK: - Отношения Presenter'a и View

//Реализует presenter
protocol LoginPresenterInferfaceForViewProtocol: class, LoginPresenterPropertyProtocol {
    
    //Спрашивает залогиниться
    func login(withEmail email: String, password: String)
    
}

//Реализует view
protocol LoginViewInterfaceForPresenterProtocol: class, LoginViewPropertyProtocol {

    func showErrorAlert(withErrorDescription description: String)
}


//MARK: - Отношения Presenter'a и Interactor'a

//Реализует presenter
protocol LoginPresenterInterfaceForInteractorProtocol: class, LoginPresenterPropertyProtocol {
    
    func authorizationSucceeded(name: String)
    func authorizationFailed(error: NSError)
    
}

//Реализует Interactor
protocol LoginInteractorInterfaceForPresenterProtocol: class, LoginInteractorPropertyProtocol {
    
    //в этом методе должна быть непосредственная работа с Firebase
    func authorize(withEmail email: String, password: String)
}


protocol LoginWireframeInterface: class {
    
    //Это свойство переоопределяется в каждом из методов типа create*Scene()
    var currentViewController: UIViewController { get set }
    
    func createLoginScene() -> LoginViewController
    //func createRegistrationScene() -> RegistrationViewController
    
    //По-моему эти два метода придятся объединить, так как они оба состоят в tabbar controller'e и инициализируются одновременно
    
    func createMainScene() -> UITabBarController
    
    func performSegue(withIdentifier identifier: String, towards viewController: UIViewController)
    
}
