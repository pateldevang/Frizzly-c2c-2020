//
//  ProfileSetUpViewController.swift
//  Frizzly
//
//  Created by Devang Patel on 08/03/20.
//  Copyright © 2020 Devang Patel. All rights reserved.
//

import UIKit
import Firebase

class ProfileSetUpViewController: UIViewController {

    // MARK :- Outlets
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var netact: UIActivityIndicatorView!
    
    // Variables
    var ref : DatabaseReference!
    var codeA : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        // Hide activity monitor
        self.netact.isHidden = true
        
//        ref = Database.database().reference()
//        print("---------------------------")
//        self.ref!.child("AcessCode").setValue(["Acess": "1239"])
        
        
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
        print("---------------------------")
        self.netact.isHidden = false
        netact.startAnimating()
        ref = Database.database().reference()
        ref?.child("AcessCode").observe(.childAdded, with: { (snapshot) in
//            print(snapshot.value)
            self.codeA = snapshot.value as! String
            print(self.codeA)
            if (self.code.text == self.codeA) {
                self.performSegue(withIdentifier: "toTab", sender: self)
            }
        })
        
        
    }
    
}



//MARK: - Extensions
extension ProfileSetUpViewController: UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        code.delegate = self
    }
}
