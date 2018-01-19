//
//  AuthProvider.swift
//  uride
//
//  Created by 王資猛 on 2018/1/18.
//  Copyright © 2018年 王資猛. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias LoginHandler = (_ msg: String?) -> Void;

struct LoginErrorCode {
    static let INVALID_EMAIL = " please provide a valid email address";
    
    static let WRONG_PASSWORD = " please enter the correct password";
    
    static let PROBLEM_CONNECTING = " problem connecting";
    
    static let USER_NOT_FOUND = " user not found";
    
    static let EMAIL_ALREADY_IN_USE = " email is already in use";
    
}

class AuthProvider {
    private static let _instance = AuthProvider()
    
    static var Instance: AuthProvider {
        return _instance;
    }
    
    func login(withEmail: String, password:String, loginHandler: LoginHandler?) {
        
        Auth.auth().signIn(withEmail: withEmail, password: password, completion: { (user,error) in
            
            if error != nil {
                self.handleErrors(err: error as! NSError, loginHandler: loginHandler);
            
            }else {
                loginHandler?(nil);
            }

            
    }
        )
    
}  // login func
    
    private func handleErrors(err: NSError, loginHandler: LoginHandler?) {
        if let errCode = AuthErrorCode(rawValue: err.code) {
          switch errCode {
            
          case .wrongPassword:
            loginHandler?(LoginErrorCode.WRONG_PASSWORD);
            break;
            
          case .invalidEmail:
            loginHandler?(LoginErrorCode.INVALID_EMAIL);
            break;
            
          case .userNotFound:
            loginHandler?(LoginErrorCode.USER_NOT_FOUND);
            break;
            
          case .emailAlreadyInUse:
            loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE);
            break;
            
          default:
            loginHandler?(LoginErrorCode.PROBLEM_CONNECTING);
            break;
            
  
          }
        }
    }

}// class
