//
//  PhotosCollectionViewCell.swift
//  MotoCollection
//
//  Created by Ilgar Ilyasov on 1/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet { updateViews() }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    private func updateViews() {
        
    }
}
