//
//  PhotoController.swift
//  MotoCollection
//
//  Created by Ilgar Ilyasov on 1/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    private(set) var photos: [Photo] = []
    
    func createPhoto(with ImageData: Data, and title: String) {
        let photo = Photo(imageData: ImageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        photos.remove(at: index)
        
        let photo = Photo(imageData: imageData, title: title)
        photos.insert(photo, at: index)
    }
}
