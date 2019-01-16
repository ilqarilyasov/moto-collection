//
//  PhotosCollectionViewController.swift
//  MotoCollection
//
//  Created by Ilgar Ilyasov on 1/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func setTheme() {
        guard let currentThemePreference = themeHelper.themePreference else { return }
        
        if currentThemePreference == "Dark" {
            collectionView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
