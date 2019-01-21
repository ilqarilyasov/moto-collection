//
//  PhotoDetailViewController.swift
//  MotoCollection
//
//  Created by Ilgar Ilyasov on 1/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton, forEvent event: UIEvent) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let original = info[.originalImage] as? UIImage else { return }
        detailImageView.image = original
        
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
        guard let photoController = photoController,
            let image = detailImageView.image,
            let imageData = image.pngData(),
            let text = photoTextField.text else { return }
        
        if let photo = photo {
            photoController.update(photo: photo, imageData: imageData , title: text)
        } else {
            photoController.createPhoto(with: imageData, and: text)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func setTheme() {
        guard let currentPreference = themeHelper?.themePreference else { return }
        
        if currentPreference == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        } else if currentPreference == "Light" {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo, isViewLoaded {
            detailImageView.image = UIImage(data: photo.imageData)
            photoTextField.text = photo.title
            navigationItem.title = "Edit Photo"
        } else {
            navigationItem.title = "Add Photo"
        }
    }
}
