//
//  PhotosListViewModel.swift
//  ToDoList
//
//  Created by Büşra Güneş on 24.09.2022.
//

import Foundation


protocol PhotosListViewModelViewProtocol:AnyObject{
    func didCellItemFetch(_ items: [PhotosCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class PhotosListViewModel{
    
    private  let model = PhotosListModel()
    
    weak var viewDelegate:PhotosListViewModelViewProtocol?
    
    init(){
        model.delegate = self
    }
    
    func DidViewLoad(){
        model.fecthData()
    }
    func didClickItem(at index :Int){
        let selectedItem = model.images[index]
        //TODO NAVİGATE
    }
}
private extension PhotosListViewModel{
    @discardableResult // sarı uyarı için.
    func makeViewBasedModel(_ posts: [Image]) -> [PhotosCellViewModel]{
        return posts.map{.init(image:$0.url)}
    }
}


// MARK: - PostListModelProtocol
extension PhotosListViewModel: PhotosListModelProtocol{
    func didDataFetchProcessFinish(_ isSucces:Bool) {
        
        if isSucces{
            let images = model.images
            let cellModels = makeViewBasedModel(images)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        }else{
            viewDelegate?.showEmptyView()
        }
        
    }
}
