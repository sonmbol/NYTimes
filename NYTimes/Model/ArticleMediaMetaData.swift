//
//  ArticleMediaMetaData.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//
import Foundation

struct ArticleMediaMetaData :Codable {
    
    var url,format : String?
    var height,width : Int?
    
    enum CodingKeys: String, CodingKey {
        case url,format,height,width
    }
    
}
