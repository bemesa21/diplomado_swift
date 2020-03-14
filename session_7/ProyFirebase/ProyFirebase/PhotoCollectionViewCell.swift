//
//  PhotoCollectionViewCell.swift
//  ProyFirebase
//
//  Created by Berenice Medel on 14/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit


class PhotoCollectionViewCell: UICollectionViewCell {
    var photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return pv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("pintanto")
        addSubview(photoView)
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
   }
