//
//  PostListTableViewCell.swift
//  ToDoList
//
//  Created by Büşra Güneş on 23.09.2022.
//

import UIKit

class PostListTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private(set) weak var postTitleLabel: UILabel!  
    @IBOutlet private(set) weak var postDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // containerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        containerView.layer.cornerRadius = 8
    }
}

