//
//  SettingViewController.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        setSettingView()
    }
    
    func setSettingView() {
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        titleLabel.text = "Setting"
        titleLabel.backgroundColor = .yellow
        titleLabel.textAlignment = .center
        titleLabel.center = self.view.center
        titleLabel.frame.origin.y = getNavigationHeight() + 50
        self.view.addSubview(titleLabel)
        
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
