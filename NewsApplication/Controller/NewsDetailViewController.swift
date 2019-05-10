//
//  NewsDetailViewController.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit
import WebKit


class NewsDetailViewController: UIViewController {
    
    let webView: WKWebView = WKWebView()
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .lightGray
        
        setWebView()
        
        loadNews()
    }
    
    func setWebView() {
        webView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(webView)
        
    }
    
    private func loadNews() {
        guard let urlString = urlString else {
            return
        }
        
        guard let url: URL = URL(string: urlString) else {
            return
        }
        let request: URLRequest = URLRequest(url: url)
        webView.load(request)
    }
}

