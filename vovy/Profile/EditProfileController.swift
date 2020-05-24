//
//  EditProfileController.swift
//  vovy
//
//  Created by Alfon on 20/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class EditProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: Selector("printTombol"))
        self.navigationItem.rightBarButtonItem  = button1
        
    }
    
    @objc func printTombol() {
        
    }

}
