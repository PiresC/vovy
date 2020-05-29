//
//  lihatSemuaKegiatanCell.swift
//  vovy
//
//  Created by Alfon on 25/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class lihatSemuaKegiatanCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var namaKegiatan: UILabel!
    @IBOutlet weak var organisasi: UILabel!
    
    static let identifier = "lihatSemuaKegiatanCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 25
        layer.masksToBounds = true
    }
    
    static func nib() -> UINib {
        return UINib(nibName:  "lihatSemuaKegiatanCell", bundle: nil)
    }
    
    public func configure(with image: UIImage, namaKegiatan: String, organisasi: String) {
        self.image.image = image
        self.namaKegiatan.text = namaKegiatan
        self.organisasi.text = organisasi
    }

}
