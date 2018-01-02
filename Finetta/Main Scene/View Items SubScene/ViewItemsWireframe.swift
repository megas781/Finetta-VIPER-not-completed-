//
//  ViewItemsRouter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/2/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import Foundation
import UIKit

class ViewItemsWireframe: ViewItemsWireframeInterface {
    
    
    unowned var currentViewController: UIViewController
    
    init() {
        self.currentViewController = UIViewController()
        
        
    }
    
    
    
    func createMainScene() -> UITabBarController {
        
        let theTabBarController = (mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController)
        
        //First Stage - View Items scene
        
        //инициализации
        let registrationView = (theTabBarController.viewControllers![0] as! UINavigationController).topViewController as! ViewItemsTableViewController
        let registrationPresenter = ViewItemsPresenter.init()
        let registrationInteractor = ViewItemsInteractor.init()
        
        //образование связей
        registrationPresenter.view = registrationView
        registrationView.presenter = registrationPresenter
        registrationPresenter.interactor = registrationInteractor
        registrationInteractor.presenter = registrationPresenter
        registrationPresenter.wireframe = ViewItemsWireframe.init()
        
        
        self.currentViewController = registrationView
        
        return theTabBarController
        
    }
    
    func performSegue(withIdentifier identifier: String, towards viewController: UIViewController) {
        fatalError("is not implemented yet")
    }
}
