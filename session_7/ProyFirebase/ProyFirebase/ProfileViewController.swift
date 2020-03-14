//
//  ProfileViewController.swift
//  ProyFirebase
//
//  Created by Berenice Medel on 13/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage
import MobileCoreServices
import FirebaseUI

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    var userID:String!
    var getRef: Firestore!
    
    var optimizedImage: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getRef = Firestore.firestore()
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            if user == nil{
                print("Usuario no loggeado")
            }else{
            self.userID = user?.uid
            self.emailLabel.text = user?.email
                self.getName()
            }
        }
    }
    
    func getName(){
        var result = getRef.collection("users").document(self.userID)
        result.getDocument { (snapshot, error) in
            let lastname = snapshot?.get("lastname") as! String ?? "sin valor"
            print("documento: ", lastname)
            let name = snapshot?.get("name") as? String ?? "sin valor"
            
            self.nameLabel.text = "\(name) \(lastname)"
            
        }
    }
    @IBAction func uploadPhoto(_ sender: UIButton){
        let photoImage = UIImagePickerController()
        photoImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoImage.mediaTypes = [kUTTypeImage as String]
        photoImage.delegate =  self
        
        present(photoImage, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let optimizedImageData = imageSelected.jpegData(compressionQuality: 0.6){
            profileimage.image = imageSelected
            self.saveImage(optimizedImageData)
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func saveImage(_ imageData: Data){
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.color = .red
        activityIndicator.center = self.profileimage.center
        activityIndicator.startAnimating()
        profileimage.addSubview(activityIndicator)
        
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("photos").child(userID)
        let uploadMetadata = StorageMetadata()
        
        uploadMetadata.contentType = "image/jpeg"

        userImageRef.putData(imageData, metadata: uploadMetadata) { (StorageMetadata, error) in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            if let error = error{
                print("error: ", error.localizedDescription)
            }else{
                print(StorageMetadata?.path)
            }
        }
    }
    
    func getPhoto(){
        let storageReference = Storage.storage().reference()
               let placeholder = UIImage(named: "userIcon")
               let userImageRef = storageReference.child("/photos").child(userID)
               userImageRef.downloadURL{ (url, error) in
                   if let error = error{
                       print(error.localizedDescription)
                   }else{
                       print("imagen descargada")
                   }
                   
               }
               profileimage.sd_setImage(with: userImageRef, placeholderImage: placeholder)
        
    }
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
