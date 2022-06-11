//
//  ArticleData.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//

import Foundation
struct ArticleData : Codable {
    let articles : [Article]?
    let status : String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case articles = "results"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        articles = try values.decodeIfPresent([Article].self, forKey: .articles)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
    
    
    
}
