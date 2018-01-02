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

//Реализует presenter (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol LoginPresenterInferfaceForViewProtocol: LoginPresenterPropertyProtocol {
    
    //Спрашивает залогиниться
    func login(withEmail email: String, password: String)
    
}

//Реализует view (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol LoginViewInterfaceForPresenterProtocol: LoginViewPropertyProtocol {

    func showErrorAlert(withErrorDescription description: String)
}


//MARK: - Отношения Presenter'a и Interactor'a

//Реализует presenter (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol LoginPresenterInterfaceForInteractorProtocol: LoginPresenterPropertyProtocol {
    
    func authorizationSucceeded(name: String)
    func authorizationFailed(error: NSError)
    
}

//Реализует Interactor (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol LoginInteractorInterfaceForPresenterProtocol: LoginInteractorPropertyProtocol {
    
    //в этом методе должна быть непосредственная работа с Firebase
    func authorize(withEmail email: String, password: String)
    
    func getUser() -> User?
    
    
}


protocol LoginWireframeInterface: class {
    
    //Это свойство переоопределяется в каждом из методов типа create*Scene()
    unowned var currentViewController: UIViewController { get set }
    
    func createLoginScene() -> LoginViewController
    //func createRegistrationScene() -> RegistrationViewController
    
    //По-моему эти два метода придятся объединить, так как они оба состоят в tabbar controller'e и инициализируются одновременно
    
    
    func performSegue(withIdentifier identifier: String, towards viewController: UIViewController)
    
    func presentMainScene()
}
