//
//  SigninVC.swift
//  uride
//
//  Created by 王資猛 on 2017/12/20.
//  Copyright © 2017年 王資猛. All rights reserved.
//

import UIKit

class SigninVC: UIViewController {
    
    private let RIDER_SEGUE = "RiderVC"
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var auth = AuthProvider();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func logIn(_ sender: Any) {
        
      
        
        if emailTextField.text != "" && passwordTextField.text != ""
        {
            AuthProvider.Instance.login(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
                
                if message != nil {
                    self.alertTheUser(title: "Problem with Authentication", message: message!)
                }
                else {
                      self.performSegue(withIdentifier: self.RIDER_SEGUE, sender: nil);
                                 }
            });
        }else {
            alertTheUser(title: "Email and Password are required", message: "please enter email and password")
        }
           }

    
    
    @IBAction func signUp(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != ""
        {
            AuthProvider.Instance.signUp(withEmail: emailTextField.text! , password: passwordTextField.text! , loginHandler: { (message) in
                if message != nil {
                    self.alertTheUser(title: "Problem with creating a new user", message: message!)
                } else {
                      self.performSegue(withIdentifier: self.RIDER_SEGUE, sender: nil);
                   
                }

            });
            
        }else {
            alertTheUser(title: "Email and Password are required", message: "please enter email and password")

        }
    
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}// class
