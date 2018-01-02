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
protocol ViewItemsPresenterToViewProtocol {
    var presenter: ViewItemsViewToPresenterProtocol? { get set }
}
protocol ViewItemsViewToPresenterProtocol {
    var view: ViewItemsPresenterToViewProtocol? { get set }
}

//presenter & interactor
protocol ViewItemsPresenterToInteractorProtocol {
    var presenter: ViewItemsInteractorToPresenterProtocol? { get set }
}
protocol ViewItemsInteractorToPresenterProtocol {
    var interactor: ViewItemsPresenterToInteractorProtocol? { get set }
}

//presenter to router
protocol ViewItemsPresenterPropertyRequirement {
    var router: ViewItemsPresenterToRouterProtocol? { get set }
}
protocol ViewItemsPresenterToRouterProtocol {
    
}
