//
//  AwalViewController.swift
//  vovy
//
//  Created by Jeremy Jason on 26/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class AwalViewController: UIViewController {

    var nama = ""
    @IBOutlet weak var isiNama: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func namaField(_ sender: UITextField) {
        print(sender.text!)
        nama = sender.text!
    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
