//
//  ArticleMediaMetaDataTest.swift
//  NYTimesTests
//
//  Created by ahmed abdalla on 10/06/2022.
//

import XCTest
@testable import NYTimes

class ArticleMediaMetaDataTest: XCTestCase {

    var articleMediaMeta  : ArticleMediaMetaData!
    
    func testModel_ArticleMediaDicEqual(){
        let dict = [
                            "url": "hhttps://static01.nyt.com/images/2022/05/05/climate/00cli-SALTLAKE-socialpromo/00cli-SALTLAKE-socialpromo-mediumThreeByTwo440.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                       
        ] as [String : Any]
        
        if let art =  try? ArticleMediaMetaData(from: dict) {
            articleMediaMeta = art
        }
        XCTAssertEqual(articleMediaMeta.height,75)
        XCTAssertEqual(articleMediaMeta.width,75)
        XCTAssertEqual(articleMediaMeta.format,"Standard Thumbnail")
    }
    


}
