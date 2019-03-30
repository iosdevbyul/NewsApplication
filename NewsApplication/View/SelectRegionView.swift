//
//  SelectRegion.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-27.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit
import SwiftyPlistManager


class SelectRegionView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let sectionManager: SectionManager = SectionManager()
    
    let picker: UIPickerView = UIPickerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView()
    }
    
    func initView() {
        settingPicker()
        settingButton()
    }
    
    func settingPicker() {
        print(self.frame.size.width)
        print(self.frame.size.height)
        self.picker.frame = CGRect(x: 20, y: 20, width: self.frame.size.width - 40, height: self.frame.size.height - 80)
        print(self.picker.frame)
        self.addSubview(self.picker)
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        self.picker.selectedRow(inComponent: 0)
        
        print(self.picker.frame)
    }
    
    func settingButton() {
        let confirmButton: UIButton = UIButton(frame: CGRect(x: 20, y: picker.frame.origin.y + picker.frame.size.height + 10, width: self.frame.size.width - 40, height: 20))
        confirmButton.setTitle("Select", for: .normal)
        confirmButton.addTarget(self, action: #selector(clickSelectRegion), for: .touchUpInside)
        confirmButton.backgroundColor = .red
        self.addSubview(confirmButton)
    }
    
    @objc func clickSelectRegion() {
        let result: Int = self.picker.selectedRow(inComponent: 0)
        print("Selected row of the picker : \(result)")
        SwiftyPlistManager.shared.save(result, forKey: "Region", toPlistWithName: "News") { (error) in
            if error == nil {
                print("Saved")
                NotificationCenter.default.post(name: .didSelectRegion, object: nil, userInfo: nil)
            } else {
                print("Fail to save the data")
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sectionManager.getRegionCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sectionManager.getRegion()[row]
    }
    
    

}
