//
//  PhotosListViewController.swift
//  ToDoList
//
//  Created by Büşra Güneş on 24.09.2022.
//

import UIKit
import Kingfisher

class PhotosListViewController: UIViewController {
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    private let viewModel = PhotosListViewModel()
    private var items: [PhotosCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        viewModel.DidViewLoad()
  
    }
}

private extension PhotosListViewController{
    func setupUI(){
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        registerCell()
    }
    func registerCell(){
        photosCollectionView.register(.init(nibName: "PhotosListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotosListCollectionViewCell")
    }
}


//MARK: - ASYNC to avoid freezing on the screen

extension PhotosListViewController:PhotosListViewModelViewProtocol{ //bak
    func didCellItemFetch(_ items: [PhotosCellViewModel]) {
        DispatchQueue.main.async {
            self.items = Array(items.prefix(200))     // to bring in the first 200 of them.
            self.photosCollectionView.reloadData()
        }
    }
    func showEmptyView(){
        self.photosCollectionView.isHidden = true
        //TODO
    }
    func hideEmptyView(){
        self.photosCollectionView.isHidden = false
        //TODO
    }
}

//MARK: - POST LİST VC FUNCTIONS.

extension PhotosListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosListCollectionViewCell", for: indexPath) as! PhotosListCollectionViewCell
        cell.photosImageView.kf.setImage(with:URL(string: items[indexPath.row].image!)) //set image using KingFisher.
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
    
    
    
    
    
}
