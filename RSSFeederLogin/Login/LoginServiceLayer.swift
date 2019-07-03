//
//  LoginServiceLayer.swift
//  RSSFeederLogin
//
//  Created by Santhosh Nampally on 03/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

protocol LoginRequestDataSource {
    
}

class LoginServiceLayer {
    var dataSource:LoginRequestDataSource?
    
    func authenticateUser(completion:@escaping (Result<Any, Error>)->Void) {
        DispatchQueue(label: "serviceLayer").async {
            completion(Result.success("Success"))
        }
    }
}
