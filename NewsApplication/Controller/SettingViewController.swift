//
//  SettingViewController.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    let settingRegionButton = UIButton()
    var changeRegionView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
//        self.view.backgroundColor = .lightGray
        
        setSettingView()
        
        setNotificationForSelectRegionView()
        
        setChangeRegionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.changeRegionView.isHidden = true
    }
    
    func setNotificationForSelectRegionView() {
        NotificationCenter.default.addObserver(self, selector: #selector(didselectRegion(_:)), name: .didSelectRegion, object: nil)
    }
    
    @objc func didselectRegion(_ notification: Notification) {
        let alertController = UIAlertController(title: "Saved", message: "Selected region is saved", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.changeRegionView.isHidden = true
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setSettingView() {
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 20, height: 60))
        titleLabel.text = "Setting"
        titleLabel.textAlignment = .center
        titleLabel.center = self.view.center
        titleLabel.frame.origin.y = getNavigationHeight() + 10
        self.view.addSubview(titleLabel)
        
        settingRegionButton.frame = CGRect(x: 20, y: titleLabel.frame.origin.y + titleLabel.frame.size.height + 30, width: self.view.frame.size.width - 40, height: 40)
        settingRegionButton.setTitle("Change Region", for: .normal)
        settingRegionButton.addTarget(self, action: #selector(changeRegion), for: .touchUpInside)
        self.view.addSubview(settingRegionButton)
        
        settingRegionButton.backgroundColor = .red
    }
    
    func setChangeRegionView() {
        changeRegionView = SelectRegionView(frame: CGRect(x: 20, y: settingRegionButton.frame.origin.y, width: self.view.frame.size.width - 40, height: self.view.frame.size.height - settingRegionButton.frame.origin.y - 30))
        changeRegionView.backgroundColor = .white
        self.view.addSubview(changeRegionView)
        self.changeRegionView.isHidden = true
    }
    
    @objc func changeRegion() {
        self.changeRegionView.isHidden = false
    }
    
    private func getNavigationHeight() -> CGFloat {
        
        let height = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        
        return height
    }
}

extension Notification.Name {
    static let didSelectRegion = Notification.Name("didSelectRegion")
}
