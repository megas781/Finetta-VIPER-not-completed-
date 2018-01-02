//
//  LoginRouter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit


let mainStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)

class LoginRouter: LoginPresenterToRouterProtocol {
    
    
    
    func createLoginScene() -> LoginViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let presenter = LoginPresenter.init()
        let interactor = LoginInteractor.init()
        
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        presenter.router = self
        
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
        
        
        
        return theTabBarController
    }
    
    init() {}
    
    
    
}
