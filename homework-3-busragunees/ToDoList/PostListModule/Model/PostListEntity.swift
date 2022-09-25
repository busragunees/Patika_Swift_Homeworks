//
//  PostListEntity.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import Foundation

struct PostCellViewModel{
    
    var title:String?
    var desc:String?
}

struct Post: Decodable {  // decodable neden yaptık? sunucuya gönderme işlemim yoksa encodable yapmama gerek yok. 
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
}
