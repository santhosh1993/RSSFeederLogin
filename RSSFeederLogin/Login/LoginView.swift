//
//  LoginView.swift
//  RSSFeederLogin
//
//  Created by Santhosh Nampally on 02/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

protocol LoginViewDataSource:class {
    var userName:String {get set}
    var password:String {get set}
}

protocol LoginViewDelegate:class {
    func loginTapped()
}

class LoginView: UIView {
    @IBOutlet weak var logoImgVw: UIImageView!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var delegate:LoginViewDelegate?
    var dataSource:LoginViewDataSource?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI() {
        userNameTF.text = dataSource?.userName
        passwordTF.text = dataSource?.password
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        delegate?.loginTapped()
    }
}
