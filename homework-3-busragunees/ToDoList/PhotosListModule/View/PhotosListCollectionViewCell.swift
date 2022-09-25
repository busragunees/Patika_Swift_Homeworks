//
//  PhotosListCollectionViewCell.swift
//  ToDoList
//
//  Created by Büşra Güneş on 24.09.2022.
//

import UIKit

//MARK: - Photos cell items.

class PhotosListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private(set) weak var photosImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
    }
}
