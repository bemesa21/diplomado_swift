//
//  CentralViewController.swift
//  ProyFirebase
//
//  Created by Berenice Medel on 13/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import Firebase
class CentralViewController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        tabBar.tintColor = .black
        
        let ProfileController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController
        
        ProfileController!.tabBarItem.title = "Perfil"
        ProfileController!.tabBarItem.image = UIImage(systemName: "doc.richtext")
       
        guard let PhotosControllerTemp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoCollectionViewController") as? PhotoCollectionViewController else{ return }
        let PhotosController = UINavigationController(rootViewController: PhotosControllerTemp)
        
        PhotosController.tabBarItem.title = "Fotos"
        PhotosController.tabBarItem.image = UIImage(systemName: "doc.richtext")
        let SaveController = UINavigationController(rootViewController: ProfileViewController())
        SaveController.tabBarItem.title = "Favoritos"
        SaveController.tabBarItem.image = UIImage(systemName: "tray.and.arrow.fill")
        
        viewControllers = [
        PhotosController,
        ProfileController!,
        SaveController
        ]
    }
}
