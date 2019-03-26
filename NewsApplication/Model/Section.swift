//
//  Section.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import Foundation

class Section {
    let section: [String] = ["Regions",
                             "News",
                             "Would",
                             "Canada",
                             "Politics",
                             "Business",
                             "Health",
                             "Technology",
                             "Indigenous",
                             "Entertainment",
                             "Opinion"]
    
    func getSectionCount() -> Int {
        return section.count
    }
    
    func getSection() -> [String] {
        return section
    }
    
}
