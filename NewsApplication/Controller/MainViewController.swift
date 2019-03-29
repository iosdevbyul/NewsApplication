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
    let sectionHeight: CGFloat = 50
    
    let sectionManager = SectionManager()
    
    var selectedNewsSection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .lightGray
        checkRegion()
        setNavigation()
        setSectionView()
        setTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didClickSectionToReloadTableView(_:)), name: .didClickSection, object: nil)
    }
    
    func checkRegion() {
        SwiftyPlistManager.shared.start(plistNames: ["News"], logging: true)
        SwiftyPlistManager.shared.getValue(for: "Region", fromPlistWithName: "News") { (result, error) in
            if error == nil {
                guard let result = result else {
                    return
                }
                print("\(result)")
            }
        }

    }
    
    @objc func didClickSectionToReloadTableView(_ notification: Notification) {
        if let value = notification.userInfo?["selectedRegionSection"] {
            loadNews(value as! Int)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNews(selectedNewsSection)
    }
    
    private func loadNews(_ sectionNumber: Int) {
//        selectedNewsSection = sectionNumber
//        
//        let feedParser = FeedParser()
//        if sectionNumber == 1 {
//            return
//        }
//        let url = sectionManager.getURL(sectionNumber: sectionNumber, sectionType: 0)
//        feedParser.parseFeed(url: url) { (newsItem) in
//            self.newsItem = newsItem
//            OperationQueue.main.addOperation {
//                self.tableView.reloadData()
//            }
//        }
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
        //        print(selectedRow)
        //        performSegue(withIdentifier: newsDetailSegueIdentifier, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


extension Notification.Name {
    static let didClickSection = Notification.Name("didClickSection")

}
