//
//  PhotosListEntity.swift
//  ToDoList
//
//  Created by Büşra Güneş on 24.09.2022.
//

import Foundation

struct PhotosCellViewModel{
    
    var image:String?
}

struct Image: Decodable {  //Post'larla değişecek
    var url: String
    
}
