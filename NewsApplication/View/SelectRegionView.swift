//
//  SelectRegion.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-27.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit

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
        self.picker.frame = CGRect(x: 20, y: 20, width: self.frame.size.width - 40, height: self.frame.size.height - 80)
        self.addSubview(self.picker)
        self.picker.delegate = self
        self.picker.dataSource = self
        
        self.picker.selectedRow(inComponent: 0)
    }
    
    func settingButton() {
        let confirmButton: UIButton = UIButton(frame: CGRect(x: 20, y: picker.frame.origin.y + picker.frame.size.height + 10, width: self.frame.size.width - 40, height: 20))
        confirmButton.setTitle("Select", for: .normal)
        confirmButton.addTarget(self, action: #selector(clickSelectRegion), for: .touchUpInside)
        confirmButton.backgroundColor = .red
        self.addSubview(confirmButton)
    }
    
    @objc func clickSelectRegion() {
        print("selected")
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
