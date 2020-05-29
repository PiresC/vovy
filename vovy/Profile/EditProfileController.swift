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
    @IBOutlet weak var isiDeskripsi: UITextField!
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
    
    var selectedCounter = 0
    enum ButtonState {
        case selected
        case unselected
    }
    
    var namaUser = ""
    var desc = ""
    var selectedCategory:Array<String> = []
    var categoryImage:[String : UIButton]!
    var buttonStateDic: [UIButton : Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(title: "Simpan", style: .done, target: self, action: #selector(self.saveEditedData))
        self.navigationItem.rightBarButtonItem  = button1
        imgProfile.layer.cornerRadius = 35
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resetState()
        initCategoryImage()
        initButtonState()
        initConfig()
    }
    
    private func resetState() {
        selectedCategory.removeAll()
    }
    
    
    private func initCategoryImage() {
        categoryImage = [
            "Teknologi" : buttonTeknologi,
            "Riset" : buttonRiset,
            "Desain" : buttonDesain,
            "Sosialisasi" : buttonSosialisasi,
            "Translator" : buttonTranslator,
            "Penulis" : buttonPenulis,
            "Administrasi" : buttonAdmin,
            "Manajemen" : buttonManagemen,
            "Pelatihan" : buttonPengajaran
        ]
    }
    private func initButtonState() {
        buttonStateDic = [
            buttonTeknologi:false,
            buttonRiset:false,
            buttonDesain:false,
            buttonSosialisasi:false,
            buttonTranslator:false,
            buttonPenulis:false,
            buttonAdmin:false,
            buttonManagemen:false,
            buttonPengajaran:false
        ]
    }
    
    
    private func getInverseImage(_ button:UIButton, _ state:ButtonState) -> UIImage {
        switch button {
            case buttonAdmin:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "adminicon") : #imageLiteral(resourceName: "dim administrasi")
            case buttonDesain:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "Desain") : #imageLiteral(resourceName: "dim desain")
            case buttonManagemen:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "Manajemen") : #imageLiteral(resourceName: "dim managemen")
            case buttonPengajaran:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "Pelatihan") : #imageLiteral(resourceName: "dim pengajaran")
            case buttonPenulis:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "Penulis") : #imageLiteral(resourceName: "Dim penulis")
            case buttonRiset:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "riseticon") : #imageLiteral(resourceName: "dim riset")
            case buttonSosialisasi:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "Sosialisasi") : #imageLiteral(resourceName: "dim sosialisasi")
            case buttonTeknologi:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "Teknologi") : #imageLiteral(resourceName: "dim teknologi")
            case buttonTranslator:
                return state == ButtonState.selected ? #imageLiteral(resourceName: "translatoricon") : #imageLiteral(resourceName: "dim trasnlator")
            default:
                return #imageLiteral(resourceName: "profile")
        }
    }
    
    private func initConfig() {
        imgProfile.image = LocalStorage.getProfileImage()
        isiNama.text = LocalStorage.getName()
        isiDeskripsi.text = LocalStorage.getDescription()
        setImageSelected()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func setImageSelected() {
        initCategoryImage()
        let selected = LocalStorage.getCategories()
        for category in selected {
            if let button = categoryImage[category]{
                selectButton(button)
            }
        }
        
    }
    
    
    @IBAction func btnChooseImageOnClick(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    
    
    
    @IBAction func buttonSemua(_ sender: UIButton) {
        if ( buttonStateDic[sender]! ) {
            unselectButton(sender)
        } else {
            selectButton(sender)
        }
    }
    
    private func unselectButton(_ button:UIButton) {
        let image = getInverseImage(button, .unselected)
        button.setImage(image, for: .normal)
        buttonStateDic[button] = false
        selectedCounter -= 1
        let category = categoryImage.getKey(forValue: button)
        for i in 0...(selectedCategory.count-1) {
            if(selectedCategory[i] == category) {
                selectedCategory.remove(at: i)
                break
            }
        }
    }
    
    private func selectButton(_ button:UIButton) {
        if (selectedCounter >= 3) {
            alertUserTooMuchSelected()
        } else if buttonStateDic[button]! {
            // do nothing
        } else {
            let image = getInverseImage(button, .selected)
            button.setImage(image, for: .normal)
            buttonStateDic[button] = true
            selectedCounter += 1
            if let category = categoryImage.getKey(forValue: button) {
                selectedCategory.append(category)
            }
        }
    }
    
    private func alertUserTooMuchSelected() {
        alertUserWith(title: "Tidak Bisa Menambah Kategori", message: "Kategori yang anda pilih sudah lebih dari 3")
    }
    
    private func alertUserWith(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "tutup", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func boxNama(_ sender: UITextField) {
        namaUser = sender.text!
    }
    
    @IBAction func boxDesc(_ sender: UITextField) {
        desc = sender.text!
    }
    
    
    
    @objc func saveEditedData() {
        if selectedCategory.count > 0 {
            let selectedSet = Set(selectedCategory)
            selectedCategory = Array(selectedSet)
            LocalStorage.bulkSave(
                name: isiNama.text!,
                desc: isiDeskripsi.text!,
                categories: selectedCategory,
                image: imgProfile.image!)
            selectedCategory.removeAll()
            self.navigationController?.popViewController(animated: true)
        } else {
            alertUserWith(title: "Pilih Kategori", message: "Minimal pilihlah 1 kategori")
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imgProfile.image = image
            LocalStorage.saveProfileImage(image)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
  
}

extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
