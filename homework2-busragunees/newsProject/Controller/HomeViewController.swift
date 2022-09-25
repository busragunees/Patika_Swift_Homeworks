//
//  ViewController.swift
//  newsProject
//
//  Created by Büşra Güneş on 14.09.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
//MARK: - news item list
    var itemList = [NewsListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
    //MARK: - to get news list on screen
        itemList = NewsListHelper().getNews()
    }
}

// MARK: - collection view set size, set item, set click event etc.

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCollectionViewCell
        cell.setItem(item: itemList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeController") as! NewsDetailViewController
        home.selectedNewsList = itemList[indexPath.row]
        self.navigationController?.pushViewController(home, animated: true)
    }
}

