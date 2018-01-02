//
//  ViewItemsPresenter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/2/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import Foundation

class ViewItemsPresenter {
    var router: ViewItemsWireframeInterface?
    var view: ViewViewInterfaceForPresenterProtocol?
    var interactor: ViewItemsInteractorInterfaceForPresenterProtocol?
}


extension ViewItemsPresenter: ViewPresenterInterfaceForViewProtocol {
     
    
    
}


extension ViewItemsPresenter: ViewItemsPresenterInterfaceForInteractorProtocol {
    
    
    
}
