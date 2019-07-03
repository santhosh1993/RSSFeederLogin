//
//  LoginViewModel.swift
//  RSSFeederLogin
//
//  Created by Santhosh Nampally on 02/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate {
    func dismissTheController()
}

class LoginViewModel:LoginViewDataSource {
    
    var userName: String = ""
    var password: String = ""
    var delegate:LoginViewModelDelegate?
    
    var callBack:RSSFeederLoginCallBack? {
        didSet{
            
        }
    }
    
    func logginTapped() {
        LoginServiceLayer().authenticateUser { [weak self] (result) in
            switch result{
            case .success(let data):
                RSSFeeder.shared.updateUserDetails(data: data)
                self?.callBack?.userSuccessfullyAuthenticated()
                self?.delegate?.dismissTheController()
                break
            case .failure(let error):
                self?.callBack?.errorOccuredWhileAuthenticating()
                self?.delegate?.dismissTheController()
                break
            }
        }
    }
}
