//
//  ArticleMediaTest.swift
//  NYTimesTests
//
//  Created by ahmed abdalla on 11/06/2022.
//

import XCTest
@testable import NYTimes

class ArticleMediaTest: XCTestCase {
    
    var articleMedia  : ArticleMedia!
    
    func testModel_ArticleMediaDicEqual(){
        let dict = [
                        "type": "image",
                        "media-metadata": [[
                            "url": "https://static01.nyt.com/images/2022/05/05/climate/00cli-SALTLAKE-socialpromo/00cli-SALTLAKE-socialpromo-mediumThreeByTwo440.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        ], [
                            "url": "https://static01.nyt.com/images/2022/05/05/climate/00cli-SALTLAKE-socialpromo/00cli-SALTLAKE-socialpromo-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        ],[
                            "url": "https://static01.nyt.com/images/2022/05/05/climate/00cli-SALTLAKE-socialpromo/00cli-SALTLAKE-socialpromo-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        ]
                        ]
        ] as [String : Any]
        
        if let art =  try? ArticleMedia(from: dict) {
            articleMedia = art
        }
        XCTAssertEqual(articleMedia.type, "image")
    }
    

}
