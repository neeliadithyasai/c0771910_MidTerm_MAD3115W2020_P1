//
//  LoginViewController.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var switchRememberme: UISwitch!
    
    let email = "admin"
    let password = "admin123"
    

      override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
  
    @IBAction func btnLogin(_ sender: Any) {
        
        if txtUsername.text == email && txtPassword.text == password {
       
                }
         else{
            
           let alertController = UIAlertController(title: "Username or Password Incorrect", message: "Please check Username or password", preferredStyle: .alert)
                  let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                              
                  alertController.addAction(defaultAction)
                  self.present(alertController, animated: true, completion: nil)
           
               }
                    
              }
        
//        if txtUsername.text == txtPassword.text
//        {
//             //performSegue(withIdentifier: "segue1", sender: self)
//        } else
//        {
//
//            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//            alertController.addAction(defaultAction)
//            self.present(alertController, animated: true, completion: nil)
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


