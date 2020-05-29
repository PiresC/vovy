//
//  HomePageViewController.swift
//  vovy
//
//  Created by Alfon on 20/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//


import UIKit

class HomePageViewController: UIViewController {
    
    let kategori = ["Sosialisasi", "Translator", "Teknologi", "Penulis", "Administrasi", "Desain", "Riset", "Manajemen", "Pelatihan"]
    var res: readJson?
    var urljson = URL(string: "https://mc2-be.herokuapp.com/activities")
    let imgDescDic:[String:String] = [
        "Teknologi" : "Mengikuti perkembangan teknologi terkini",
        "Riset" : "Senang mencari tahu sesuatu lebih dalam",
        "Desain" : "Kreatif dan memiliki berbagai macam ide",
        "Sosialisasi" : "Berbagi dengan cara berinteraksi sosial",
        "Translator" : "Terampil dalam menggunakan bahasa lain",
        "Penulis" : "Menulis adalah kegiatan yang anda senangi",
        "Administrasi" : "Detail dan teliti dalam mengurus pembukuan",
        "Manajemen" : "Mengorganisir jadwal dan kegiatan",
        "Pelatihan" : "Membagikan ilmu kepada orang lain"
    ]

//    var images: [UIImage]?

    @IBOutlet weak var imageBestCategory: UIImageView!
    @IBOutlet weak var KategoriCollectionView: UICollectionView!
    @IBOutlet weak var kegiatanCollectionView: UICollectionView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryDesc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        self.loadJson()
        //LocalStorage.setQuizFlag(false)
        if LocalStorage.getQuizFlag() == false {
            performSegue(withIdentifier: "toOnBoarding", sender: nil)
        }
        navigationController?.setNavigationBarHidden(true, animated: false)
        loadingImage.loadGif(name: "loading")
        kegiatanCollectionView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        renderImage()
        setCategoryText()
    }
    
    private func setCategoryText() {
        if let category = LocalStorage.getFirstCategory(){
            categoryTitle.text = category
            categoryDesc.text = imgDescDic[category]
        }
    }
    
    private func renderImage() {
        let imgDic:[String:UIImage] = [
            "Teknologi" : #imageLiteral(resourceName: "Tech"),
            "Riset" : #imageLiteral(resourceName: "riset-1"),
            "Desain" : #imageLiteral(resourceName: "Desain-2"),
            "Sosialisasi" : #imageLiteral(resourceName: "sosial"),
            "Translator" : #imageLiteral(resourceName: "Translator-1"),
            "Penulis" : #imageLiteral(resourceName: "penulis-1"),
            "Administrasi" : #imageLiteral(resourceName: "admin"),
            "Manajemen" : #imageLiteral(resourceName: "managemen "),
            "Pelatihan" : #imageLiteral(resourceName: "learning")
        ]
        
        if let category = LocalStorage.getFirstCategory() {
            imageBestCategory.image = imgDic[category]
        }
    }
    
    func loadJson() {
        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: self.urljson!) { data,_,_ in
                if let jsonData = data {
                    
                    do {
                        self.res = try JSONDecoder().decode(readJson.self, from: jsonData)
                        DispatchQueue.main.async {
                            
                            self.kegiatanCollectionView.isHidden = false
                            self.loadingImage.isHidden = true
                        }
                        self.reloadAfterDataCollected()
                    } catch let error {
                        print(error)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func setupCollection() {
        KategoriCollectionView.register(homeKategoriCollectionView.nib(), forCellWithReuseIdentifier: homeKategoriCollectionView.identifier)
        kegiatanCollectionView.register(lihatSemuaKegiatanCell.nib(), forCellWithReuseIdentifier: lihatSemuaKegiatanCell.identifier)
    }
    
    func reloadAfterDataCollected() {
        DispatchQueue.main.async {
            self.KategoriCollectionView.delegate = self
            self.KategoriCollectionView.dataSource = self
            
            self.kegiatanCollectionView.dataSource = self
            self.kegiatanCollectionView.delegate = self
            
            self.KategoriCollectionView.reloadData()
            self.kegiatanCollectionView.reloadData()
        }
    }
    
    @IBAction func lihatSemuaKegiatan(_ sender: Any) {
        performSegue(withIdentifier: "toLihatSemuaKegiatan", sender: "")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        if segue.identifier == "toProfile" {
            navigationItem.title = "Kembali"
        }
        if let destination = segue.destination as? detialKegiatanViewController{
            destination.volunteerData = sender as? dataStructure
        } else if let destination = segue.destination as? lihatSemuaKegiatanViewController {
            destination.query = sender as? String
        }
    }
}





extension HomePageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if collectionView == self.KategoriCollectionView {
            performSegue(withIdentifier: "toLihatSemuaKegiatan", sender: kategori[indexPath.row])
        } else {
            performSegue(withIdentifier: "toDetailKegiatan", sender: res!.data[indexPath.row])
        }
    }
}

extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.KategoriCollectionView:
            return kategori.count
        default:
            return 2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.KategoriCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeKategoriCollectionView.identifier , for: indexPath) as!homeKategoriCollectionView
            
            cell.configure(with:  UIImage(named: kategori[indexPath.row])!, label: kategori[indexPath.row])
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lihatSemuaKegiatanCell.identifier , for: indexPath) as! lihatSemuaKegiatanCell
            
            let url = URL(string: res!.data[indexPath.row].image)
            var image: UIImage?
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    image = UIImage(data: data!)
                    cell.configure(with: image! , namaKegiatan: self.res!.data[indexPath.row].title, organisasi: self.res!.data[indexPath.row].source)
                }
            }
            
            return cell
        }
        
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.KategoriCollectionView {
            return CGSize (width: 90, height: 140)
        } else {
            return CGSize (width: 170, height: 220)
        }
    }
}
