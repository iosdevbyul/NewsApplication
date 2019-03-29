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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .lightGray
        
        setSettingView()
    }
    
    func setSettingView() {
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 20, height: 60))
        titleLabel.text = "Setting"
        titleLabel.backgroundColor = .red
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
    
    @objc func changeRegion() {
        print("Push Change Button")
        let changeRegionView: SelectRegionView = SelectRegionView(frame: CGRect(x: 20, y: settingRegionButton.frame.origin.y, width: self.view.frame.size.width - 40, height: self.view.frame.size.height - settingRegionButton.frame.origin.y - 30))
        changeRegionView.backgroundColor = .white
        self.view.addSubview(changeRegionView)
    }
    
    private func getNavigationHeight() -> CGFloat {
        
        let height = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        
        return height
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
