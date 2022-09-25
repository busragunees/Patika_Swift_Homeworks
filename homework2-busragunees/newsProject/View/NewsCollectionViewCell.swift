//
//  NewsCollectionViewCell.swift
//  newsProject
//
//  Created by Büşra Güneş on 14.09.2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var viewDetailButton: UILabel!
    
    func setItem(item:NewsListModel){
        newsImageView.image = item.newsImage
        newsLabel.text = item.newsTitle
        newsImageView.layer.cornerRadius = 15
        viewDetailButton.layer.masksToBounds = true
        viewDetailButton.layer.cornerRadius = 8
    }
    
}


