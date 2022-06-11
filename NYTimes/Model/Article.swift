//
//  Article.swift
//  NYTimes
//
//  Created by ahmed abdalla on 11/06/2022.
//

import Foundation

struct Article :Codable {
    
    var id : Int?
    var title,byline,date,section,abstract : String?
    var media : [ArticleMedia]?
    
    enum CodingKeys: String, CodingKey {
        case id,title,byline,media,section,abstract
        case date = "published_date"
    }
    
    func getUrlForThumbString() -> String {
        
        if let images = media?.filter({ $0.type == "image" }).first{
            if let url = images.data?.filter({ $0.height == $0.width}).first?.url {
                return url
            }
        }
        return ""
    }
    
    func getUrlForHeadertring() -> String {
        
        if let images = media?.filter({ $0.type == "image" }).first{
            if let url = images.data?.filter({ $0.format == "mediumThreeByTwo440"}).first?.url {
                return url
            }
        }
        return ""
    }
    
}
