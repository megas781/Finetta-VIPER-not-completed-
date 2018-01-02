//
//  MockViewController.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/2/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit

class MockViewController: UIViewController {
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
