//
//  SignInViewController.swift
//  Frizzly
//
//  Created by Devang Patel on 08/03/20.
//  Copyright © 2020 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate  {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var phnone: UITextField!
    @IBOutlet weak var school: UITextField!
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
    
    
    @IBAction func signIn(_ sender: Any) {
        self.netact.isHidden = false
        netact.startAnimating()
        checkNewtork(ifError: "Cannot login")
        Auth.auth().signIn(withEmail: email.text!, password: pass.text!) { (user, error)
            in
            if error != nil {
                // Vibrates on errors
                UIDevice.invalidVibrate()
                print(error?.localizedDescription ?? "Error")
                self.authAlert(titlepass: "Login failed",message: "Authentication failed please try again.")
                self.netact.isHidden = true
            }
            else {
                if Auth.auth().currentUser?.isEmailVerified == true {
                    // Vibrates on valid
                    UIDevice.validVibrate()
                    print("login Sucess")
                    self.performSegue(withIdentifier: "goToSetUp", sender: self)
                    self.netact.stopAnimating()
                    self.netact.isHidden = true
                } else {
                    self.authAlert(titlepass: "Alert", message: "Please verify your email before login.")
                }
            }
        }
    }
    
    @IBAction func Gsign(_ sender: Any) {
        checkNewtork(ifError: "Cannot login")
        self.netact.isHidden = false
        netact.startAnimating()
        gSignIn()
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}



//MARK: - Extensions
extension SignInViewController: UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        email.delegate = self
        pass.delegate = self
        school.delegate = self
        phnone.delegate = self
    }
}
