//
//  PhotoDetailViewController.swift
//  MotoCollection
//
//  Created by Ilgar Ilyasov on 1/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPhoto(_ sender: UIButton, forEvent event: UIEvent) {
        
    }
    

    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
}
