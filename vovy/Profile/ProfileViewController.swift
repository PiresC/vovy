//
//  ProfileViewController.swift
//  vovy
//
//  Created by Alfon on 20/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(title: "Ubah", style: .plain, target: self, action: Selector("editProfile")) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    @objc func editProfile() {
        performSegue(withIdentifier: "toEditProfile", sender: Any?.self)
    }

}


