//
//  PostListViewModel.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import Foundation

protocol PostListViewModelViewProtocol:AnyObject{
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class PostListViewModel{
    
    private  let model = PostListModel()
    
    weak var viewDelegate:PostListViewModelViewProtocol?
    
    init(){
        model.delegate = self
    }
    
    func DidViewLoad(){
        model.fecthData()
    }
    func didClickItem(at index :Int){
        let selectedItem = model.posts[index]
        //TODO NAVİGATE
    }
}
private extension PostListViewModel{
    @discardableResult // sarı uyarı için.
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel]{
        return posts.map{.init(title: $0.title, desc: $0.body)}
    }
}


// MARK: - PostListModelProtocol

extension PostListViewModel: PostListModelProtocol{
    func didDataFetchProcessFinish(_ isSucces:Bool) {
        
        if isSucces{
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        }else{
            viewDelegate?.showEmptyView()
        }
        
    }
}
