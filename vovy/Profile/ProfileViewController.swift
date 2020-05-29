//
//  ProfileViewController.swift
//  vovy
//
//  Created by Alfon on 20/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(title: "Ubah profil", style: .plain, target: self, action: #selector(self.editProfile))
        self.navigationItem.rightBarButtonItem  = button1
        reconf()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reconf()
    }
    
    private func reconf() {
        profileImage.image = LocalStorage.getProfileImage()
        nameLabel.text = LocalStorage.getName()
        descLabel.text = LocalStorage.getDescription()
    }
    
    @objc func editProfile() {
        performSegue(withIdentifier: "toEditProfile", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditProfile" {
            navigationItem.title = "Kembali"
        }
    }

}
