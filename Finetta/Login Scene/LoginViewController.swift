//
//  ViewController.swift
//  Finetta
//
//  Created by Gleb Kalachev on 1/1/18.
//  Copyright © 2018 Gleb Kalachev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: LoginPresenterInferfaceForViewProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.resignFirstResponder)))
        
    }
    
    
    @IBAction func aTextFieldPrimaryActionTriggered(_ sender: UITextField) {
        switch sender {
        case mailTextField:
            self.passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            //и еще здесь нужно будет выполнить вход
            
            self.enterButtonTapped(UIButton.init())
            
        default:
            fatalError("выпал неожиданный дефолтный кейс")
        }
    }
    
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        
        self.presenter?.login(withEmail: self.mailTextField.text ?? "", password: self.passwordTextField.text ?? "")
        
    }
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "fromRVCtoLVCsegueIdentifier", sender: self)
        
    }
    
    @objc func resignAnyFirstResponder() {
        self.mailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepareForSegue works!!")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("login view controller aDecoder init")
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("login view controller nib init")
    }
    
    deinit {
        print("login view controller deinit")
    }
}

//presenter asks view
extension LoginViewController: LoginViewInterfaceForPresenterProtocol {
    func showErrorAlert(withErrorDescription description: String) {
        self.presentErrorAlertController(withTitle: "Произошла ошибка", message: description)
    }
    
    
}

