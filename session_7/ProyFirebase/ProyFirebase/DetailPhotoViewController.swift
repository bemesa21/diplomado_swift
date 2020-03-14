//
//  DetailPhotoViewController.swift
//  ProyFirebase
//
//  Created by Berenice Medel on 14/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseUI

class DetailPhotoViewController: UIViewController{
    
    var imagen:UIImage! = nil
    var userID:String!

    let photoView: UIImageView = {
        let pv = UIImageView(frame:CGRect(x: 8, y: 8, width: 300, height: 300))
        return pv
    }()
    
    let saveButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Descargar imagen", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(savePhoto), for: .touchUpInside )
        
        return b
    }()
    
    let agregarFavoritos: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Agregar a favoritos", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        return b
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .cyan
        photoView.image = imagen
        photoView.center = view.center
        view.addSubview(photoView)
        view.addSubview(saveButton)
        view.addSubview(agregarFavoritos)
        saveButton.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 10).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        agregarFavoritos.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10).isActive = true
        agregarFavoritos.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        Auth.auth().addStateDidChangeListener{ (auth, user) in
                   if user == nil{
                       print("Usuario no loggeado")
                   }else{
                   self.userID = user?.uid
                   }
               }
        
    }
    @objc func savePhoto(){
        guard let imagen  = photoView.image else { return }
        UIImageWriteToSavedPhotosAlbum(imagen, nil, #selector(image), nil)
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        
    }
    
    @objc func uploadPhoto(){
        guard let image  = photoView.image else { return }
        let optimizedImageData = image.jpegData(compressionQuality: 0.6)
        self.saveImage(optimizedImageData!)
    }
    
    func saveImage(_ imageData: Data){
      
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("photos").child(self.userID).child(UUID().uuidString)
        let uploadMetadata = StorageMetadata()
          
          uploadMetadata.contentType = "image/jpeg"

          userImageRef.putData(imageData, metadata: uploadMetadata) { (StorageMetadata, error) in
              if let error = error{
                  print("error: ", error.localizedDescription)
              }else{
                  print(StorageMetadata?.path)
              }
          }
      }
    
}
