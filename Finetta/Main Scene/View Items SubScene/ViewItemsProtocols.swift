//
//  ViewItemsProtocols.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/2/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit
import Firebase

//Протоколы свойств
protocol ViewItemsPresenterPropertyProtocol: class {
    weak var view: ViewItemsViewInterfaceForPresenterProtocol? { get set }
    var wireframe: ViewItemsWireframeInterface? { get set }
    var interactor: ViewItemsInteractorInterfaceForPresenterProtocol? { get set }
}
protocol ViewItemsViewPropertyProtocol: class {
    var presenter: ViewItemsPresenterInferfaceForViewProtocol? { get set }
}
protocol ViewItemsInteractorPropertyProtocol: class {
    weak var presenter: ViewItemsPresenterInterfaceForInteractorProtocol? { get set }
}

//MARK: - Отношения Presenter'a и View

//Реализует presenter (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol ViewItemsPresenterInferfaceForViewProtocol: ViewItemsPresenterPropertyProtocol {
    
}

//Реализует view (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol ViewItemsViewInterfaceForPresenterProtocol: ViewItemsViewPropertyProtocol {
    
}


//MARK: - Отношения Presenter'a и Interactor'a

//Реализует presenter (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol ViewItemsPresenterInterfaceForInteractorProtocol: ViewItemsPresenterPropertyProtocol {
    
}

//Реализует Interactor (здесь не нужно писать, что это классовый протокол, так как этот протокол уже наследует тот, который классовый)
protocol ViewItemsInteractorInterfaceForPresenterProtocol: ViewItemsInteractorPropertyProtocol {
    
}


protocol ViewItemsWireframeInterface: class {
    
    //Это свойство переоопределяется в каждом из методов типа create*Scene()
    unowned var currentViewController: UIViewController { get set }
    
    func createMainScene() -> UITabBarController
    
    func performSegue(withIdentifier identifier: String, towards viewController: UIViewController)
    
}
