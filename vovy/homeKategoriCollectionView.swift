//
//  homeKategoriCollectionView.swift
//  vovy
//
//  Created by Alfon on 25/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class homeKategoriCollectionView: UICollectionViewCell {

    @IBOutlet weak var kategoriImage: UIImageView!
    @IBOutlet weak var kategoriLabel: UILabel!
    
    static let identifier = "homeKategoriCollectionView"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage, label: String) {
        kategoriImage.image = image
        kategoriLabel.text = label
    }
    
    static func nib() -> UINib {
        return UINib(nibName:  "homeKategoriCollectionView", bundle: nil)
    }
}
