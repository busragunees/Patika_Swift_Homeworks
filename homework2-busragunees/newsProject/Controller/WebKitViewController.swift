//
//  WebKitViewController.swift
//  newsProject
//
//  Created by Büşra Güneş on 16.09.2022.
//

import UIKit
import WebKit


class WebKitViewController: UIViewController {
    
    @IBOutlet weak var webKit: WKWebView!
    
    var newsURL:String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL.init(string: newsURL){
            let urlRequest = URLRequest.init(url: url)
            webKit.load(urlRequest)
            
        }
    }
}
