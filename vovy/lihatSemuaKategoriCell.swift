//
//  lihatSemuaKategoriCell.swift
//  vovy
//
//  Created by Alfon on 25/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class lihatSemuaKategoriCell: UICollectionViewCell {

    @IBOutlet weak var kategoriImage: UIImageView!
    @IBOutlet weak var kategoriLabel: UILabel!
    
    static let identifier = "lihatSemuaKategoriCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    public func configure(with image: UIImage, label: String) {
        kategoriImage.image = image
        kategoriLabel.text = label
    }
    
    static func nib() -> UINib {
        return UINib(nibName:  "lihatSemuaKategoriCell", bundle: nil)
    }
}
