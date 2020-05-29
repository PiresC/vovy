//
//  lihatSemuaKategoriViewController.swift
//  vovy
//
//  Created by Alfon on 25/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class lihatSemuaKategoriViewController: UIViewController {
    @IBOutlet weak var allKategori: UICollectionView!
    @IBOutlet weak var lihatSemua: UIButton!
    
    
    let kategori = ["Sosialisasi", "Translator", "Teknologi", "Penulis", "Administrasi", "Desain", "Riset", "Manajemen", "Pelatihan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lihatSemua.layer.cornerRadius = 10
        lihatSemua.layer.masksToBounds = true
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize (width: 95, height: 140)
        layout.scrollDirection = .vertical
        
        allKategori.register(lihatSemuaKategoriCell.nib(), forCellWithReuseIdentifier: lihatSemuaKategoriCell.identifier)
        
        allKategori.delegate = self
        allKategori.dataSource = self
        
        self.title = "Semua Kategori"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? lihatSemuaKegiatanViewController {
            destination.query = sender as? String
        }
    }
    @IBAction func lihatSemuaKegiatan(_ sender: Any) {
        performSegue(withIdentifier: "toSemuaKegiatan", sender: "")
    }
    
}

extension lihatSemuaKategoriViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "toSemuaKegiatan", sender: kategori[indexPath.row])
    }
}

extension lihatSemuaKategoriViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kategori.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lihatSemuaKategoriCell.identifier , for: indexPath) as!lihatSemuaKategoriCell
        
        cell.configure(with:  UIImage(named: kategori[indexPath.row])!, label: kategori[indexPath.row])
        
        return cell
    }
}

extension lihatSemuaKategoriViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 95, height: 140)
    }
}
