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
    
    func createMainScene() -> UITabBarController {
        
        let theTabBarController = (mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController)
        
        //First Stage - View Items scene
        let view1 = (theTabBarController.viewControllers![0] as! UINavigationController).topViewController as! ViewItemsTableViewController
        let presenter1 = ViewItemsPresenter.init()
        let interactor1 = ViewItemsInteractor.init()
        
        presenter1.view = view1
        view1.presenter = presenter1
        presenter1.interactor = interactor1
        interactor1.presenter = presenter1
        presenter1.router = ViewItemsRouter.init()
        
        
        self.currentViewController = view1
        
        return theTabBarController
    }
    
    
//    
//    func showMainScene() {
////        let segue = UIStoryboardSegue.init(identifier: "asdf", source: self.currentViewController, destination: self.createMainScene())
////        segue.perform()
//        
//        
//    }
    
    
    func performSegue(withIdentifier identifier: String, towards viewController: UIViewController) {
        let segue = UIStoryboardSegue.init(identifier: identifier, source: self.currentViewController, destination: self.createMainScene())
        segue.perform()
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
