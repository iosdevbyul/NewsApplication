//
//  SelectRegion.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-27.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit

class SelectRegion: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerData: [String] = [
    "British Columbia",
    "Kamloops",
    "Calgary",
    "Edmonton",
    "Saskatchewan",
    "Saskatoon",
    "Manitoba",
    "Thunder Bay",
    "Sudbury",
    "Windsor",
    "London",
    "Kitchener-Waterloo",
    "Toronto",
    "Hamilton",
    "Montreal",
    "New Brunswick",
    "Prince Edward Island",
    "Nova Scotia",
    "Newfoundland & Labrador",
    "North"
    ]
    
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
        picker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200)
        picker.center = self.center
        self.addSubview(picker)
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.selectedRow(inComponent: 0)
    }
    
    func settingButton() {
        let button: UIButton = UIButton(frame: CGRect(x: (self.frame.size.width)/2 - 50, y: picker.frame.origin.y + picker.frame.size.height + 30, width: 100, height: 40))
        button.titleLabel?.text = "Select"
        button.addTarget(self, action: #selector(clickSelectRegion), for: .touchUpInside)
        self.addSubview(button)
    }
    
    @objc func clickSelectRegion() {
        print("selected")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    

}
