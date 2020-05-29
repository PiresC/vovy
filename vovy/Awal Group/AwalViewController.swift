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
    
    @IBAction func validatingBeforeSegue(_ sender: Any) {
        nama = isiNama.text!
        if nama.count < 3 {
            alertMinimalCharaNotExceed()
        } else {
            LocalStorage.saveName(nama)
            performSegue(withIdentifier: "toQuiz", sender: "")
        }
    }
    
    private func alertMinimalCharaNotExceed() {
        let alert = UIAlertController(title: "Masukan nama anda", message: "Masukan nama anda di kolom yang telah disediakan", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "tutup", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
