//
//  RssNews.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import Foundation

struct News {
    var title = ""
    var link = ""
    var pubdate = ""
    var author = ""
    var category = ""
    var description = ""
}

class FeedParser: NSObject, XMLParserDelegate {
    
    private var newsItems: [News] = []
    private var currentElement: String = "" {
        didSet {
            currentElement = currentElement.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentLink = "" {
        didSet {
            currentLink = currentLink.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentLanguage = "" {
        didSet {
            currentLanguage = currentLanguage.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubdate = "" {
        didSet {
            currentPubdate = currentPubdate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentCopyRight = "" {
        didSet {
            currentCopyRight = currentCopyRight.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDocs = "" {
        didSet {
            currentDocs = currentDocs.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentCategory = "" {
        didSet {
            currentCategory = currentCategory.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentAuthor = "" {
        didSet {
            currentAuthor = currentAuthor.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var parserCompletionHandler: (([News]) -> Void)?
    
    
    func parseFeed(url: String, completionHandler: (([News]) -> Void)?) {
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    print(error.localizedDescription)
                }
                
                return
            }
            
            //parse our data
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            
        }
        task.resume()
    }
    
    // MARK: - XML Parser Delegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentLink = ""
            currentDocs = ""
            currentElement = ""
            currentLanguage = ""
            currentCopyRight = ""
            currentDescription = ""
            currentPubdate = ""
            currentAuthor = ""
            currentCategory = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title": currentTitle += string
        case "link": currentLink += string
        case "pubDate": currentPubdate += string
        case "author": currentAuthor += string
        case "category": currentCategory += string
        case "description": currentDescription += string
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = News(title: currentTitle, link: currentLink, pubdate: currentPubdate, author: currentAuthor, category: currentCategory, description: currentDescription)
            self.newsItems.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(newsItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription )
    }
}


