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
    var images: [UIImage]?

    @IBOutlet weak var KategoriCollectionView: UICollectionView!
    @IBOutlet weak var kegiatanCollectionView: UICollectionView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        self.loadJson()
        //LocalStorage.setQuizFlag(false)
        if LocalStorage.getQuizFlag() == false {
            performSegue(withIdentifier: "toOnBoarding", sender: nil)
        }
        
        loadingImage.loadGif(name: "loading")
        kegiatanCollectionView.isHidden = true
    }
    
    func loadJson() {
        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: self.urljson!) { data,_,_ in
                    let jsonData = data
                    
                    do {
                        self.res = try JSONDecoder().decode(readJson.self, from: jsonData!)
                        DispatchQueue.main.async {
                            
                            self.kegiatanCollectionView.isHidden = false
                            self.loadingImage.isHidden = true
                        }
                        self.reloadAfterDataCollected()
                    } catch let error {
                        print(error)
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
