//
//  HomeController.swift
//  newsProject
//
//  Created by Büşra Güneş on 14.09.2022.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var goToNewsButton: UIButton!
    
    //MARK: - button news detail codes.
    
    var selectedNewsList:NewsListModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsImage.image = selectedNewsList.newsImage
        newsTitleLabel.text = selectedNewsList.newsTitle
        newsDescriptionLabel.text = selectedNewsList.newsDescription
        newsImage.layer.cornerRadius = 30
        goToNewsButton.addTarget(self, action: #selector(goToNewsURL), for: .touchUpInside)
        
    }
    @objc func goToNewsURL(){
        let webKitVC = self.storyboard?.instantiateViewController(withIdentifier: "webKitIdentfy") as! WebKitViewController
        webKitVC.newsURL = selectedNewsList.newsUrl
        self.navigationController?.pushViewController(webKitVC, animated: true)
    }
}

