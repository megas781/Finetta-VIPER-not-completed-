//
//  ViewItemsViewController.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit

class ViewItemsTableViewController: UITableViewController {
    
    var presenter: ViewItemsPresenterInferfaceForViewProtocol?
    
}

extension ViewItemsTableViewController: ViewItemsViewInterfaceForPresenterProtocol {
    
    override func viewDidLoad() {
        
    }
    
    
}
