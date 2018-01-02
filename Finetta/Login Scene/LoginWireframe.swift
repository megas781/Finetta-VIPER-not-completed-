//
//  LoginRouter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit


let mainStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)


class LoginWireframe: LoginWireframeInterface {
    
    
    
    unowned var currentViewController: UIViewController
    
    
    func createLoginScene() -> LoginViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let presenter = LoginPresenter.init()
        let interactor = LoginInteractor.init()
        
        //двусторонняя связь presenter-view
        viewController.presenter = presenter
        presenter.view = viewController
        //двусторонняя связь presenter-interactor
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        //односторонняя связь presenter->router
        presenter.wireframe = self
        
        self.currentViewController = viewController
        
        return viewController
        
    }
    
    
    func performSegue(withIdentifier identifier: String, towards viewController: UIViewController) {
        
    }
    
    func presentMainScene() {
        self.currentViewController.performSegue(withIdentifier: "fromLoginToMainSegueIdentifier", sender: self.currentViewController)
    }
    
    init() {
        print("login wireframe init")
        
        //Этот урод не хочет давать мне сделать lazy unowned свойство, сделаем такую хрень
        self.currentViewController = UIViewController()
        
        
        //Теперь, когда наш класс инициализирован, можно использовать createLoginScene метод, и поставить уже нормальный viewController в currentViewController
        self.currentViewController = self.createLoginScene()
    }
    
    deinit {
        print("login wireframe deinit")
    }
    
    
}
