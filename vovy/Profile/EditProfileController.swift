//
//  EditProfileController.swift
//  vovy
//
//  Created by Alfon on 20/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class EditProfileController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var isiNama: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnChooseImage: UIButton!
    @IBOutlet weak var buttonAdmin: UIButton!
    @IBOutlet weak var buttonDesain: UIButton!
    @IBOutlet weak var buttonManagemen: UIButton!
    @IBOutlet weak var buttonPengajaran: UIButton!
    @IBOutlet weak var buttonPenulis: UIButton!
    @IBOutlet weak var buttonRiset: UIButton!
    @IBOutlet weak var buttonSosialisasi: UIButton!
    @IBOutlet weak var buttonTeknologi: UIButton!
    @IBOutlet weak var buttonTranslator: UIButton!
    
    var namaUser = ""
    var desc = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: Selector("printTombol"))
        self.navigationItem.rightBarButtonItem  = button1
         imgProfile.layer.cornerRadius = 35
        
      
    }
    
    
    
    @IBAction func btnChooseImageOnClick(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    
    
    
    @IBAction func buttonSemua(_ sender: UIButton) {
        
        switch sender{
        case buttonAdmin:
            sender.setImage(#imageLiteral(resourceName: "adminicon"), for: .normal)
        case buttonDesain:
            sender.setImage(#imageLiteral(resourceName: "Desain"), for: .normal)
        case buttonManagemen:
            sender.setImage(#imageLiteral(resourceName: "Manajemen"), for: .normal)
        case buttonPengajaran:
            sender.setImage(#imageLiteral(resourceName: "teaching dan pengajaranicon"), for: .normal)
        case buttonPenulis:
            sender.setImage(#imageLiteral(resourceName: "writing icon"), for: .normal)
        case buttonRiset:
            sender.setImage(#imageLiteral(resourceName: "riseticon"), for: .normal)
        case buttonSosialisasi:
            sender.setImage(#imageLiteral(resourceName: "sosmedicon"), for: .normal)
        case buttonTeknologi:
            sender.setImage(#imageLiteral(resourceName: "teknologiicon"), for: .normal)
        case buttonTranslator:
            sender.setImage(#imageLiteral(resourceName: "translatoricon"), for: .normal)
        default:
            print("0")
        }
    }
    
    @IBAction func boxNama(_ sender: UITextField) {
        namaUser = sender.text!
    }
    
    @IBAction func boxDesc(_ sender: UITextField) {
        desc = sender.text!
    }
    
    
    
    @objc func printTombol() {
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imgProfile.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
  
}
