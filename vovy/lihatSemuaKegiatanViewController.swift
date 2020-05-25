//
//  lihatSemuaKegiatanViewController.swift
//  vovy
//
//  Created by Alfon on 25/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class lihatSemuaKegiatanViewController: UIViewController {
    
    @IBOutlet weak var semuaKegiatan: UICollectionView!
    let kategori = ["Sosialisasi", "Translator", "Teknologi", "Penulis", "Administrasi", "Desain", "Riset", "Manajemen", "Pelatihan"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        semuaKegiatan.register(lihatSemuaKegiatanCell.nib(), forCellWithReuseIdentifier: lihatSemuaKegiatanCell.identifier)
        
        self.title = "Semua Kegiatan"
        semuaKegiatan.dataSource = self
        semuaKegiatan.delegate = self
    }
    
}

extension lihatSemuaKegiatanViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("press this image indexpath-\(indexPath )")
    }
}

extension lihatSemuaKegiatanViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->  UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lihatSemuaKegiatanCell.identifier , for: indexPath) as!lihatSemuaKegiatanCell
        
        cell.configure(with:  UIImage(named: kategori[indexPath.row])!, namaKegiatan: "Fundraising Team Thirst Project Jakarta", organisasi: "Indorelawan")
        
        return cell
    }
}

extension lihatSemuaKegiatanViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 170, height: 220)
    }
}
