//
//  RSSFeeder.swift
//  RSSFeederLogin
//
//  Created by Santhosh Nampally on 02/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

public protocol RSSFeederLoginCallBack{
    func errorOccuredWhileAuthenticating()
    func userSuccessfullyAuthenticated()
}

public protocol RSSFeederLogOutCallBack{
    func errorOccuredWhileLoggingOut()
    func userSuccessfullyLoggedOut()
}

fileprivate class UserDetails {
    
}

public class RSSFeeder {
    
    static let shared:RSSFeeder = RSSFeeder()
    
    private let userDetails = UserDetails()
    
    //MARK:- PUBLIC Methods
    
    public static func authenticateTheUser(callBack:RSSFeederLoginCallBack) {
        shared.presentLoginViewController(callBack: callBack)
    }
    
    public static func logoutTheUser(callBack:RSSFeederLogOutCallBack){
        callBack.userSuccessfullyLoggedOut()
    }
    
    //MARK:- INTERNAL AND PRIVATE Methods
    
    func presentLoginViewController(callBack:RSSFeederLoginCallBack) {
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
    
    func updateUserDetails(data:Any) {
        print(data)
    }
}
