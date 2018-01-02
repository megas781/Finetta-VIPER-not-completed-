//
//  VC+builder.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit

//Building
extension UIViewController {
    
    func presentErrorAlertController(withTitle title: String, message: String) {
        
        let ac = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(ac, animated: true, completion: nil)
        
    }
    
}
