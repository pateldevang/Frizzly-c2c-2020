//
//  depositViewController.swift
//  Frizzly
//
//  Created by Devang Patel on 08/03/20.
//  Copyright © 2020 Devang Patel. All rights reserved.
//

import UIKit

class depositViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var payTable: UITableView!
    
    @IBOutlet weak var amount: UITextField!
    
    let imgArr = ["bhim","card","emi","netbank","paypal"]
    let textARR = ["UPI BHIM","Credit/Debit/ATM Card","EMI","Net Banking","PayPal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payTable.tableFooterView = UIView()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textARR.count
    }
    // Setting custom row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    //Did select row at
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! depositTableViewCell
        cell.img.image = UIImage(named: "\(imgArr[indexPath.row])")
        cell.nametext.text = "\(textARR[indexPath.row])"
        return cell
    }
    
}

extension depositViewController: UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        amount.delegate = self
    }
}
