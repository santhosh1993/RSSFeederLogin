//
//  LoginViewController.swift
//  RSSFeederLogin
//
//  Created by Santhosh Nampally on 02/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginVw:LoginView!
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        loginVw.delegate = self
        loginVw.dataSource = viewModel
    }
    
    func callBackReference(_ callBack: RSSFeederLoginCallBack) {
        viewModel.callBack = callBack
    }
}

extension LoginViewController:LoginViewDelegate {
    func loginTapped() {
        viewModel.logginTapped()
    }
}

extension LoginViewController:LoginViewModelDelegate {
    func dismissTheController() {
        DispatchQueue.main.async {
            self.dismiss(animated: true) {
                
            }
        }
    }
}
