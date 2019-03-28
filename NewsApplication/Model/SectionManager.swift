//
//  Section.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import Foundation

class SectionManager {
    let newsSection: [String] = ["Top News",        //0
                             "Region",          //1
                             "Would",           //2
                             "Canada",          //3
                             "Politics",        //4
                             "Business",        //5
                             "Health",          //6
                             "Technology",      //7
                             "Indigenous",      //8
                             "Entertainment",   //9
                             "Opinion"]         //10
    
    func getNewsSectionCount() -> Int {
        return newsSection.count
    }
    
    func getNewsSection() -> [String] {
        return newsSection
    }
    
    let region: [String] = [
        "British Columbia",         //0
        "Kamloops",                 //1
        "Calgary",                  //2
        "Edmonton",                 //3
        "Saskatchewan",             //4
        "Saskatoon",                //5
        "Manitoba",                 //6
        "Thunder Bay",              //7
        "Sudbury",                  //8
        "Windsor",                  //9
        "London",                   //10
        "Kitchener-Waterloo",       //11
        "Toronto",                  //12
        "Hamilton",                 //13
        "Montreal",                 //14
        "New Brunswick",            //15
        "Prince Edward Island",     //16
        "Nova Scotia",              //17
        "Newfoundland & Labrador",  //18
        "North"                     //19
        ]
    
    func getRegionCount() -> Int {
        return region.count
    }
    
    func getRegion() -> [String] {
        return region
    }
    
    func getURL(sectionNumber: Int, sectionType: Int) -> String {
        //Section Type
        // 0 : News Section
        // 1 : Region Section
        
        var url: String = ""
        
        if sectionType == 0 {
            
            if sectionNumber == 0 {
                url = "https://rss.cbc.ca/lineup/topstories.xml"
//            } else if sectionNumber == 1 {
//                url = ""
            } else if sectionNumber == 2 {
                url = "https://rss.cbc.ca/lineup/world.xml"
            } else if sectionNumber == 3 {
                url = "https://rss.cbc.ca/lineup/canada.xml"
            } else if sectionNumber == 4 {
                url = "https://rss.cbc.ca/lineup/politics.xml"
            } else if sectionNumber == 5 {
                url = "https://rss.cbc.ca/lineup/business.xml"
            } else if sectionNumber == 6 {
                url = "https://rss.cbc.ca/lineup/health.xml"
            } else if sectionNumber == 7 {
                url = "https://rss.cbc.ca/lineup/technology.xml"
            } else if sectionNumber == 8 {
                url = "https://www.cbc.ca/cmlink/rss-cbcaboriginal"
            } else if sectionNumber == 9 {
                url = "https://rss.cbc.ca/lineup/arts.xml"
            } else if sectionNumber == 10 {
                url = "https://rss.cbc.ca/lineup/offbeat.xml"
            } else {
                return url
            }
        } else if sectionType == 1 {
            if sectionNumber == 0 {
                url = "https://rss.cbc.ca/lineup/canada-britishcolumbia.xml"
            } else if sectionNumber == 1 {
                url = "https://rss.cbc.ca/lineup/canada-kamloops.xml"
            } else if sectionNumber == 2 {
                url = "https://rss.cbc.ca/lineup/canada-calgary.xml"
            } else if sectionNumber == 3 {
                url = "https://rss.cbc.ca/lineup/canada-edmonton.xml"
            } else if sectionNumber == 4 {
                url = "https://rss.cbc.ca/lineup/canada-saskatchewan.xml"
            } else if sectionNumber == 5 {
                url = "https://rss.cbc.ca/lineup/canada-saskatoon.xml"
            } else if sectionNumber == 6 {
                url = "https://rss.cbc.ca/lineup/canada-manitoba.xml"
            } else if sectionNumber == 7 {
                url = "https://rss.cbc.ca/lineup/canada-thunderbay.xml"
            } else if sectionNumber == 8 {
                url = "https://rss.cbc.ca/lineup/canada-sudbury.xml"
            } else if sectionNumber == 9 {
                url = "https://rss.cbc.ca/lineup/canada-windsor.xml"
            } else if sectionNumber == 10 {
                url = "https://www.cbc.ca/cmlink/rss-canada-london"
            } else if sectionNumber == 11 {
                url = "https://rss.cbc.ca/lineup/canada-kitchenerwaterloo.xml"
            } else if sectionNumber == 12 {
                url = "https://rss.cbc.ca/lineup/canada-toronto.xml"
            } else if sectionNumber == 13 {
                url = "https://rss.cbc.ca/lineup/canada-hamiltonnews.xml"
            } else if sectionNumber == 14 {
                url = "http://rss.cbc.ca/lineup/canada-montreal.xml"
            } else if sectionNumber == 15 {
                url = "https://rss.cbc.ca/lineup/canada-newbrunswick.xml"
            } else if sectionNumber == 16 {
                url = "https://rss.cbc.ca/lineup/canada-pei.xml"
            } else if sectionNumber == 17 {
                url = "https://rss.cbc.ca/lineup/canada-novascotia.xml"
            } else if sectionNumber == 18 {
                url = "https://rss.cbc.ca/lineup/canada-newfoundland.xml"
            } else if sectionNumber == 19 {
                url = "https://rss.cbc.ca/lineup/canada-north.xml"
            }
            else {
                return url
            }
        }
        return url
    }
    
}
