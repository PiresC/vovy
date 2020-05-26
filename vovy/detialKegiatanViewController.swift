//
//  detialKegiatanViewController.swift
//  vovy
//
//  Created by Alfon on 26/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class detialKegiatanViewController: ViewController {
    
    var volunteerData: dataStructure?
    @IBOutlet weak var judulVolunteer: UILabel!
    @IBOutlet weak var imageVolunteer: UIImageView!
    @IBOutlet weak var kriteriaVolunteer: UILabel!
    @IBOutlet weak var deskripsiVolunteer: UILabel!
    @IBOutlet weak var tanggalMulai: UILabel!
    @IBOutlet weak var pelajariLebih: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageVolunteer.layer.cornerRadius = 20
        imageVolunteer.layer.masksToBounds = true
        
        pelajariLebih.layer.cornerRadius = 10
        pelajariLebih.layer.masksToBounds = true
        
        let url = URL(string: volunteerData!.image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageVolunteer.image = UIImage(data: data!)
            }
        }
        
        self.title = volunteerData?.source
        judulVolunteer.text = volunteerData?.title
        kriteriaVolunteer.text = volunteerData?.additional_information[0]
        deskripsiVolunteer.text = volunteerData?.description
        tanggalMulai.text = volunteerData?.start_date
    }
    
    @IBAction func keWebsite(_ sender: Any) {
        if let url = URL(string: volunteerData!.website_link) {
            UIApplication.shared.open(url)
        }
    }
    
    
}
