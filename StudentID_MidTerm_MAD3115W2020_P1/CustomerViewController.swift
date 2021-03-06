//
//  CustomerTableViewController.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {
    
    @IBOutlet weak var tblCustomers: UITableView!
    
    @IBAction func btnLogout(_ sender: Any) {
        let alert = UIAlertController(title: "Logged Out!", message: "you are logged out of current session", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToMenu", sender: self)
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    lazy var customerNames : [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Customer"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customerNames = DataStorage.getInstance().getAllCustomers()
        tblCustomers.reloadData()
    }
    
}
extension CustomerViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return customerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
        let customer = customerNames[indexPath.row]
        cell?.textLabel?.text = customer.fullName
        
        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrail = customerNames[indexPath.row]
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = sb.instantiateViewController(identifier: "billDetails") as? billDetailsViewController {
            navigationController?.pushViewController(viewController, animated: true)
            viewController.customerBill = selectedTrail
        }
        
    }
    
}

