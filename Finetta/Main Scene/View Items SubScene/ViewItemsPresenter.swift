//
//  ViewItemsPresenter.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/2/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import Foundation

class ViewItemsPresenter {
    var wireframe: ViewItemsWireframeInterface?
    weak var view: ViewItemsViewInterfaceForPresenterProtocol?
    var interactor: ViewItemsInteractorInterfaceForPresenterProtocol?
}


extension ViewItemsPresenter: ViewItemsPresenterInferfaceForViewProtocol {
    
    
     
    
    
}


extension ViewItemsPresenter: ViewItemsPresenterInterfaceForInteractorProtocol {
    
    
    
}
