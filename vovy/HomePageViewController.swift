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
    let urljson = URL(string: "https://mc2-be.herokuapp.com/activities")
    

    @IBOutlet weak var KategoriCollectionView: UICollectionView!
    @IBOutlet weak var kegiatanCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadJson()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        /*
        let layout = UICollectionViewFlowLayout()
         layout.itemSize = CGSize (width: 90, height: 140)
         layout.scrollDirection = .horizontal
         KategoriCollectionView.collectionViewLayout = layout
     */
    }
    
    func loadJson() {
        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: self.urljson!) { data,_,_ in
                    let jsonData = data
                    
                    do {
                        self.res = try JSONDecoder().decode(readJson.self, from: jsonData!)
                        DispatchQueue.main.async {
                            self.setupCollection()
                            self.kegiatanCollectionView.reloadData()
                        }
                        
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
    
}

extension HomePageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if collectionView == self.KategoriCollectionView {
            print("Kategori Kegiatan")
        } else {
            print("List Kegiatan yang ada")
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
            
            cell.configure(with:  UIImage(named: self.kategori[indexPath.row])!, namaKegiatan: "self.res!.data[indexPath.row].title", organisasi: "self.res!.data[indexPath.row].source")
            
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
