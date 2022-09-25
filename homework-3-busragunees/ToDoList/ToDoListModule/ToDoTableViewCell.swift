//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedImage: UIImageView!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setItem(item:ToDoEntity){
        if let note = item.note{
            titleLabel.text = note
        }
        
    // Date Extencion :
        createdDateLabel.text = item.createdDate?.getFormattedDate(format: .ddMMM)
  
        if (item.isCompleted){
            completedImage.tintColor = UIColor(ciColor: .green)
        }else{
            completedImage.tintColor = UIColor(ciColor: .gray)
        }
    }

}
