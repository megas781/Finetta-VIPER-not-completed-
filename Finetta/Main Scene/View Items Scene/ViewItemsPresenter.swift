//
//  ViewItemsPresenter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/2/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import Foundation

class ViewItemsPresenter: ViewItemsPresenterPropertyRequirement {
    var router: ViewItemsPresenterToRouterProtocol?
    var view: ViewItemsPresenterToViewProtocol?
    var interactor: ViewItemsPresenterToInteractorProtocol?
}


extension ViewItemsPresenter: ViewItemsViewToPresenterProtocol {
     
    
    
}


extension ViewItemsPresenter: ViewItemsInteractorToPresenterProtocol {
    
    
    
}
