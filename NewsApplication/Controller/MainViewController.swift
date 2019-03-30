//
//  ViewController.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit
import SwiftyPlistManager

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var newsItem: [News]?
    
    var selectedRow: Int?
    
    let tableView: UITableView = UITableView()
    private let refreshControl = UIRefreshControl()
    let activityIndicatorView = UIActivityIndicatorView()

    let sectionHeight: CGFloat = 50
    
    let sectionManager = SectionManager()

    var selectedSectionType: Int = 0
    var selectedSectionNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .lightGray
        
        setNavigation()
        setSectionView()
        setTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didClickSectionToReloadTableView(_:)), name: .didClickSection, object: nil)
    }
    
    func checkRegion() -> Int {
        var returnResult: Int = 0
        
        SwiftyPlistManager.shared.start(plistNames: ["News"], logging: true)
        SwiftyPlistManager.shared.getValue(for: "Region", fromPlistWithName: "News") { (result, error) in
            if error == nil {
                guard let result = result else {
                    return
                }
                returnResult = result as! Int
            }
        }
        return returnResult
    }
    
    @objc func didClickSectionToReloadTableView(_ notification: Notification) {
        if let value = notification.userInfo?["selectedRegionSection"] {
            selectedSectionType = 0
            if value as! Int == 1 {
                selectedSectionType = 1
                loadNews(sectionType: selectedSectionType, sectionNumber: checkRegion())
            } else {
                selectedSectionType = 0
                loadNews(sectionType: selectedSectionType, sectionNumber: value as! Int)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNews(sectionType: selectedSectionType, sectionNumber: selectedSectionNumber)
    }
    
    private func loadNews(sectionType: Int, sectionNumber: Int) {
        selectedSectionType = sectionType
        selectedSectionNumber = sectionNumber
        
        let feedParser = FeedParser()
        
        var url: String?
        
        if sectionNumber == 1 {
            
            let result = checkRegion()
            
            url = sectionManager.getURL(sectionType: selectedSectionType, sectionNumber: result)
        }else {
            url = sectionManager.getURL(sectionType: selectedSectionType, sectionNumber: sectionNumber)
        }
        
        guard let requestedUrl = url else {
            return
        }
        
        if(requestedUrl == "") {
            print("Fail to get requested URL")
            
        } else {
        feedParser.parseFeed(url: requestedUrl) { (newsItem) in
            self.newsItem = newsItem
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
        }
    }
    
    func setNavigation() {
        self.title = "My Pic News"
        
        let barButton = UIBarButtonItem(image: UIImage(named: "headView_setting"), style: .plain, target: self, action: #selector(gotoSetting))
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    @objc func gotoSetting() {
        let nextViewController = SettingViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func getNavigationHeight() -> CGFloat {
        
        let height = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        
        return height
    }
    
    func setSectionView() {
        let secView: SectionView = SectionView(frame: CGRect(x: 0, y: getNavigationHeight(), width: self.view.frame.width, height: sectionHeight))
        
        self.view.addSubview(secView)
    }
    
    func setTableView() {
        let tableViewY = getNavigationHeight() + sectionHeight
        
        tableView.frame = CGRect(x: 0, y: tableViewY, width: self.view.frame.width, height: self.view.frame.height - tableViewY)
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        setRefreshControl()

    }
    
    func setRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = self.refreshControl
        } else {
            tableView.addSubview(self.refreshControl)
        }
        self.refreshControl.addTarget(self, action: #selector(refreshTableView(_:)), for: .valueChanged)
        
        self.refreshControl.tintColor = .red
        

//        let myAttribute = [NSAttributedString.Key.foregroundColor: UIColor.red]
//        let myAttrString = NSAttributedString(string: "Reloading News Data ...", attributes: myAttribute)
//        self.refreshControl.attributedTitle = myAttrString
    }
    
    @objc func refreshTableView(_ sender: Any) {
        self.loadNews(sectionType: selectedSectionType, sectionNumber: selectedSectionNumber)
        self.refreshControl.endRefreshing()
        self.activityIndicatorView.stopAnimating()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        guard let item = newsItem?[indexPath.item] else {
            return UITableViewCell()
        }
        cell.textLabel?.numberOfLines = 3
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRow = indexPath.row
        
        guard let item = newsItem?[indexPath.item] else {
            return
        }
        
        let destination = NewsDetailViewController()
        destination.urlString = item.link
        navigationController?.pushViewController(destination, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
}


extension Notification.Name {
    static let didClickSection = Notification.Name("didClickSection")
}
