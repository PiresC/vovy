//
//  ResultViewController.swift
//  vovy
//
//  Created by Jeremy Jason on 21/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
       var isiSebelah = ""
       var isiSebelah2 = ""
       var isiSebelah3 = ""
    
    @IBOutlet weak var labelBidang: UILabel!
    
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var recomendKiri: UIImageView!
    @IBOutlet weak var recomendKanan: UIImageView!
    
     var gambar = [ #imageLiteral(resourceName: "sosialisai logo"),#imageLiteral(resourceName: "desain logo"),#imageLiteral(resourceName: "riset logo"),#imageLiteral(resourceName: "translator logo"),#imageLiteral(resourceName: "manajemen logo"),#imageLiteral(resourceName: "penulis logo"),#imageLiteral(resourceName: "tech logo"),#imageLiteral(resourceName: "admin logo"),#imageLiteral(resourceName: "pelatihan logo")]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            switch isiSebelah {
                
    //1
            case "Realistic":
                labelBidang.text = "Pengembang Teknologi"
                imageHeader.image = #imageLiteral(resourceName: "Tekno")
                
                switch isiSebelah2 {
                case "Investigate":
                    recomendKiri.image = #imageLiteral(resourceName: "riset logo")
                    
                    switch isiSebelah3 {
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "pelatihan logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Artistic":
                    recomendKiri.image = #imageLiteral(resourceName: "penulis logo")
                    
                    switch isiSebelah3{
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Social":
                    recomendKiri.image = #imageLiteral(resourceName: "sosialisai logo")
                    
                    switch isiSebelah3 {
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "penulis logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Entreprising":
                    recomendKiri.image = #imageLiteral(resourceName: "manajemen logo")
                    
                    switch isiSebelah3 {
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "translator logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Conventional" :
                    recomendKiri.image = #imageLiteral(resourceName: "admin logo")
                    
                    switch isiSebelah3 {
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "pelatihan logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                default:
                    print("Erorr bro, ada yang salah pasti")
                }
                
                
    //2
            case "Investigate":
                labelBidang.text = "Riset"
                imageHeader.image = #imageLiteral(resourceName: "Riset")
                
                switch isiSebelah2 {
                case "Realistic":
                    recomendKiri.image = #imageLiteral(resourceName: "tech logo") //realistic
                    
                    switch isiSebelah3 {
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "penulis logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "pelatihan logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Artistic":
                    recomendKiri.image = #imageLiteral(resourceName: "translator logo")
                    
                    switch isiSebelah3{
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Social":
                    recomendKiri.image = #imageLiteral(resourceName: "sosialisai logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "penulis logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Entreprising":
                    recomendKiri.image = #imageLiteral(resourceName: "manajemen logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Conventional" :
                    recomendKiri.image = #imageLiteral(resourceName: "admin logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "pelatihan logo")
                    case "Entreprising":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                default:
                    print("Erorr bro, ada yang salah pasti")
                }
                
    //3
            case "Artistic":
                let Art = ["Penulis & Editor" , "Desain" , "Translator"]
                labelBidang.text = Art[0]
                imageHeader.image = #imageLiteral(resourceName: "pengjaran")
                recomendKiri.image = #imageLiteral(resourceName: "desain logo") // desain
                recomendKanan.image = #imageLiteral(resourceName: "translator logo") // Translator
                
    //4
            case "Social": //Social media , Pengajaran / Pelatihan
                let Soc = ["Socialisasi media" , "Pengajaran / Pelatihan"]
                imageHeader.image = #imageLiteral(resourceName: "medsos")
                labelBidang.text = Soc[0]
                recomendKiri.image = #imageLiteral(resourceName: "pelatihan logo") // Pengajaran
                
                switch isiSebelah2 {
                case "Realistic":
                    recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                case "Artistic":
                    recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                case "Conventional":
                    recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                case "Entreprising":
                    recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                case "Investigate":
                    recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                default:
                    print("Erorr bro, ada yang salah pasti")
                }
                
    //5
            case "Entreprising":
                labelBidang.text = "Managemen Proyek"
                imageHeader.image = #imageLiteral(resourceName: "Mene")
                switch isiSebelah2 {
                case "Realistic":
                    recomendKiri.image = #imageLiteral(resourceName: "tech logo") //realistic
                    
                    switch isiSebelah3 {
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "penulis logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Artistic":
                    recomendKiri.image = #imageLiteral(resourceName: "penulis logo")
                    
                    switch isiSebelah3{
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Social":
                    recomendKiri.image = #imageLiteral(resourceName: "pelatihan logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Investigate":
                    recomendKiri.image = #imageLiteral(resourceName: "riset logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "penulis logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Conventional" :
                        recomendKanan.image = #imageLiteral(resourceName: "admin logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Conventional" :
                    recomendKiri.image = #imageLiteral(resourceName: "admin logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                default:
                    print("Erorr bro, ada yang salah pasti")
                }
                
                
                
    //6
            case "Conventional" :
                labelBidang.text = "Administrasi"
                imageHeader.image = #imageLiteral(resourceName: "adminis ")
                switch isiSebelah2 {
                case "Realistic":
                    recomendKiri.image = #imageLiteral(resourceName: "tech logo") //realistic
                    
                    switch isiSebelah3 {
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "penulis logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Entreprising" :
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Artistic":
                    recomendKiri.image = #imageLiteral(resourceName: "penulis logo")
                    
                    switch isiSebelah3{
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Entreprising" :
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Social":
                    recomendKiri.image = #imageLiteral(resourceName: "pelatihan logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    case "Entreprising" :
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Investigate":
                    recomendKiri.image = #imageLiteral(resourceName: "riset logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "desain logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "sosialisai logo")
                    case "Entreprising" :
                        recomendKanan.image = #imageLiteral(resourceName: "manajemen logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                case "Entreprising" :
                    recomendKiri.image = #imageLiteral(resourceName: "manajemen logo")
                    
                    switch isiSebelah3 {
                    case "Realistic":
                        recomendKanan.image = #imageLiteral(resourceName: "tech logo")
                    case "Artistic":
                        recomendKanan.image = #imageLiteral(resourceName: "penulis logo")
                    case "Social":
                        recomendKanan.image = #imageLiteral(resourceName: "pelatihan logo")
                    case "Investigate":
                        recomendKanan.image = #imageLiteral(resourceName: "riset logo")
                    default:
                        print("Erorr bro, ada yang salah pasti")
                    }
                    
                default:
                    print("Erorr bro, ada yang salah pasti")
                }
                
                
            default:
                print("Erorr bro, ada yang salah pasti")
            }
            
        }
        
    @IBAction func gotoHome(_ sender: Any) {
        LocalStorage.setQuizFlag(true)
        restartApplication()
        
    }
    
    func restartApplication () {
        self.dismiss(animated: true, completion: {});
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    

    

}
