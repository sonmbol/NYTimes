//
//  ArticleMedia.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//

import Foundation

struct ArticleMedia :Codable {
    
    var type : String?
    var data : [ArticleMediaMetaData]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case data = "media-metadata"
    }
    
}
