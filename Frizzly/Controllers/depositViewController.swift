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
    
    
    let imgArr = ["bhim","card","emi","netbank","paypal"]
    let textARR = ["UPI BHIM","Credit/Debit/ATM Card","EMI","Net Banking","PayPal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textARR.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! depositTableViewCell
        cell.img.image = UIImage(named: "\(imgArr[indexPath.row])")
        cell.nametext.text = "\(textARR[indexPath.row])"
        return cell
    }
    
}
