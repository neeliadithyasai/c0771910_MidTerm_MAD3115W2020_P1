//
//  LoginViewController.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    enum LoginError: Error{
        case emailError, passwordError, incomplete
    }
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var switchRememberme: UISwitch!
    @IBOutlet weak var txtPassword: UITextField!
    
    var myUserDefault: UserDefaults!
    let email = String()
    let password = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ud = UserDefaults.standard
        let e = ud.string(forKey: "email")
        let p = ud.string(forKey: "password")
        
        if let em = e {
            txtUsername.text = "\(em)"
        }
        
        if let pa = p {
            txtPassword.text = "\(pa)"
        }
        
        
        
    }
    
    func getPlist(withName name: String) -> [String: String]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: String]
        }
        
        return nil
    }
    
    
    
    
    
    @IBAction func btnLogin(_ sender: Any)
    {
        guard let access = getPlist(withName: "users") else{
            print("no no")
            return
        }
        
        var canEnter = false
        for (k,v) in access
        {
            if txtUsername.text! == k && txtPassword.text! == v
            {
                canEnter = true
            }
        }
        if canEnter
        {

                if switchRememberme.isOn
                {
                    UserDefaults.standard.set(txtUsername.text, forKey: "email")
                    UserDefaults.standard.set(txtPassword.text, forKey: "password")
                    
                    let ud = UserDefaults.standard
                    let email = ud.string(forKey: "email")
                    txtUsername.text = email
                    let password = ud.string(forKey: "password")
                    txtPassword.text = password
                    
                }else
                {
                    UserDefaults.standard.removeObject(forKey: "email")
                    UserDefaults.standard.removeObject(forKey: "password")
                    txtUsername.text = ""
                    txtPassword.text = ""
                }
                
           
            
        }
        else
        {
            
            let alertController = UIAlertController(title: "Username or Password Incorrect", message: "Please check Username or password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
            
            
        }
        
    }
    
    
    @IBAction func switchRememberMe(_ sender: UISwitch)
    {
        
        
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
