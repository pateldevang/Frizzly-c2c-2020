//
//  ProfileSetUpViewController.swift
//  Frizzly
//
//  Created by Devang Patel on 08/03/20.
//  Copyright © 2020 Devang Patel. All rights reserved.
//

import UIKit

class ProfileSetUpViewController: UIViewController {

    // MARK :- Outlets
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var netact: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        // Hide activity monitor
        self.netact.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot login")
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    @IBAction func submit(_ sender: Any) {
        self.netact.isHidden = false
        netact.startAnimating()
    }
    
}



//MARK: - Extensions
extension ProfileSetUpViewController: UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        code.delegate = self
    }
}
