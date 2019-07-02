//
//  RSSFeeder.swift
//  RSSFeederLogin
//
//  Created by Santhosh Nampally on 02/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

public protocol RSSFeederCallBackProtocol{
    func errorOccuredWhileAuthenticating()
    func userSuccessfullyAuthenticated()
}

class UserDetails {
    
}

public class RSSFeeder {
    
    static let shared:RSSFeeder = RSSFeeder()
    
    private let userDetails = UserDetails()
    
    public static func authenticateTheUser(callBack:RSSFeederCallBackProtocol) {
        shared.presentLoginViewController(callBack: callBack)
    }
    
    func presentLoginViewController(callBack:RSSFeederCallBackProtocol) {
        if let loginVC = UIStoryboard(name: "LoginStoryBoard", bundle: Bundle(for: type(of: self))).instantiateViewController(withIdentifier: "LoginViewControllerIdentifier") as? LoginViewController {
            
            loginVC.callBackReference(callBack)
            DispatchQueue.main.async {
                UIApplication.shared.delegate?.window??.rootViewController?.present(loginVC, animated: false, completion: {
                    
                })
            }
            
        }
        else{
            callBack.errorOccuredWhileAuthenticating()
        }
    }
    
    func updateUserDetails() {
        
    }
}
