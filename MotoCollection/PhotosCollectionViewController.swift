//
//  PhotosCollectionViewController.swift
//  MotoCollection
//
//  Created by Ilgar Ilyasov on 1/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let reuseIdentifier = "PhotoCell"
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }
    
    func setTheme() {
        guard let currentThemePreference = themeHelper.themePreference else { return }
        
        if currentThemePreference == "Dark" {
            collectionView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        } else if currentThemePreference == "Light" {
            collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            
            guard let selectedCell = sender as? PhotosCollectionViewCell,
                let indexPath = collectionView.indexPath(for: selectedCell) else { return }
            
            let photo = photoController.photos[indexPath.item]
            photoDetailVC.photo = photo
            
        } else if segue.identifier == "AddSegue" {
            
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
            
        } else if segue.identifier == "ThemeSegue" {
            
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
            themeSelectionVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let customCell = cell as? PhotosCollectionViewCell else { return cell }
        
        let photo = photoController.photos[indexPath.item]
        customCell.photo = photo
    
        return customCell
    }
}
