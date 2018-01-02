//
//  ViewItemsProtocols.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/2/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit
import Firebase

//presenter & view
protocol ViewViewInterfaceForPresenterProtocol {
    var presenter: ViewPresenterInterfaceForViewProtocol? { get set }
}
protocol ViewPresenterInterfaceForViewProtocol {
    var router: ViewItemsWireframeInterface? { get set }
    var view: ViewViewInterfaceForPresenterProtocol? { get set }
}

//presenter & interactor
protocol ViewItemsInteractorInterfaceForPresenterProtocol {
    var presenter: ViewItemsPresenterInterfaceForInteractorProtocol? { get set }
}
protocol ViewItemsPresenterInterfaceForInteractorProtocol {
    var interactor: ViewItemsInteractorInterfaceForPresenterProtocol? { get set }
}

//presenter to router
//protocol ViewItemsPresenterPropertyRequirement {
//    var router: ViewItemsPresenterToRouterProtocol? { get set }
//}
protocol ViewItemsWireframeInterface {
    
}
