//
//  PostListModel.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import Foundation

protocol PostListModelProtocol:AnyObject{
    func didDataFetchProcessFinish(_ isSucces:Bool)
}

class PostListModel{
    weak var delegate: PostListModelProtocol?
    
    var posts: [Post] = []
    
    func fecthData(){
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else{
            delegate?.didDataFetchProcessFinish(false)
            return
        }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            guard
                error == nil
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            guard
                  statusCode >= 200,
                  statusCode < 300
            else {
               self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            (response as! HTTPURLResponse).statusCode

            guard let data = data else{
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                self.posts = try jsonDecoder.decode([Post].self, from: data)
                self.delegate?.didDataFetchProcessFinish(true)
            }catch{
                self.delegate?.didDataFetchProcessFinish(false)
            }
        }
        
        task.resume()
    }
}
