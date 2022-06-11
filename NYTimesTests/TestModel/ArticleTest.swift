//
//  ArticleTest.swift
//  NYTimesTests
//
//  Created by ahmed abdalla on 11/06/2022.
//

import XCTest
@testable import NYTimes

class ArticleTest: XCTestCase {
    
    
    var article  : Article!
    
    
    func testModelArticle_IsNotEqual(){
        
        let dict = ["id": 1,
                    "published_date": "2022-06-10",
                    "section": "Style",
                    "byline": "By Tammy La Gorce",
                    "title": "Fitting Into His Schedule, Then Into Her Royal Family",
                    "abstract": "Jamal Akil Robinson offered just 30 minutes for his first get-together with Edna Tafari Makonnen, an Ethiopian princess. When the meeting ran to an hour, he saw it as a good sign."
        ] as [String : Any]
        if let art =  try? Article(from: dict) {
            article = art
        }
        XCTAssertNotEqual(article.id, 0)
        XCTAssertNotEqual(article.date,"")
        XCTAssertNotEqual(article.title, "")
        XCTAssertNotEqual(article.byline, "")
        XCTAssertNotEqual(article.section, "")
        XCTAssertNotEqual(article.abstract, "")
    }
    
    func testModel_ArticleIsEqual(){
        let dict = ["id": 1,
                    "published_date": "2022-06-10",
                    "section": "Style",
                    "byline": "By Tammy La Gorce",
                    "title": "Fitting Into His Schedule, Then Into Her Royal Family",
                    "abstract": "Jamal Akil Robinson offered just 30 minutes for his first get-together with Edna Tafari Makonnen, an Ethiopian princess. When the meeting ran to an hour, he saw it as a good sign."
        ] as [String : Any]
        if let art =  try? Article(from: dict) {
            article = art
        }
        XCTAssertEqual(article.id, 1)
        XCTAssertEqual(article.date,"2022-06-10")
        XCTAssertEqual(article.title, "Fitting Into His Schedule, Then Into Her Royal Family")
        XCTAssertEqual(article.byline, "By Tammy La Gorce")
        XCTAssertEqual(article.section, "Style")
        XCTAssertEqual(article.abstract, "Jamal Akil Robinson offered just 30 minutes for his first get-together with Edna Tafari Makonnen, an Ethiopian princess. When the meeting ran to an hour, he saw it as a good sign.")
        
    }
    
    func testModel_ArticleDicEqual(){
        let dict = ["id": 1,
                    "published_date": "2022-06-10",
                    "section": "Style",
                    "byline": "By Tammy La Gorce",
                    "title": "Fitting Into His Schedule, Then Into Her Royal Family",
                    "abstract": "Jamal Akil Robinson offered just 30 minutes for his first get-together with Edna Tafari Makonnen, an Ethiopian princess. When the meeting ran to an hour, he saw it as a good sign.",
                    "media": [[
                        "type": "image",
                        "media-metadata": [[
                            "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        ],
                        [
                            "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/merlin_206595858_ac3bf921-3d38-4925-b5c7-301bd039adf3-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        ],
                        [
                            "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/merlin_206595858_ac3bf921-3d38-4925-b5c7-301bd039adf3-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        ]
                        ]
                    ]]
        ] as [String : Any]
        
        if let art =  try? Article(from: dict) {
            article = art
        }
        XCTAssertEqual(article.id, 1)
        XCTAssertEqual(article.date,"2022-06-10")
        XCTAssertEqual(article.title, "Fitting Into His Schedule, Then Into Her Royal Family")
        XCTAssertEqual(article.byline, "By Tammy La Gorce")
        XCTAssertEqual(article.section, "Style")
        XCTAssertEqual(article.abstract, "Jamal Akil Robinson offered just 30 minutes for his first get-together with Edna Tafari Makonnen, an Ethiopian princess. When the meeting ran to an hour, he saw it as a good sign.")
        XCTAssertEqual(article.getUrlForThumbString(), "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg")
        XCTAssertEqual(article.getUrlForHeadertring(), "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/merlin_206595858_ac3bf921-3d38-4925-b5c7-301bd039adf3-mediumThreeByTwo440.jpg")
    }
    
    func testModel_ArticleImageTypeEmpty(){
        let dict = [
            "media": [[
                "type": "video",
                "media-metadata": [[
                    "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg",
                    "format": "Standard Thumbnail",
                    "height": 75,
                    "width": 75
                ], [
                    "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg",
                    "format": "mediumThreeByTwo210",
                    "height": 140,
                    "width": 210
                ],[
                    "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg",
                    "format": "mediumThreeByTwo440",
                    "height": 293,
                    "width": 440
                ]
                ]]
            ]
            
        ] as [String : Any]
        
        if let art =  try? Article(from: dict) {
            article = art
        }
        XCTAssertEqual(article.getUrlForHeadertring(), "")
    }
    
    func testModel_ArticleImageThumbEmpty(){
        let dict = [
            "media": [[
                "type": "image",
                "media-metadata": [ [
                    "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg",
                    "format": "mediumThreeByTwo210",
                    "height": 140,
                    "width": 210
                ],[
                    "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg",
                    "format": "mediumThreeByTwo440",
                    "height": 293,
                    "width": 440
                ]
                ]
            ]]
        ] as [String : Any]
        
        if let art =  try? Article(from: dict) {
            article = art
        }
        XCTAssertEqual(article.getUrlForThumbString(), "")
    }
    
    
    func testModel_ArticleImageHeaderEmpty(){
        let dict = [
            "media": [[
                "type": "image",
                "media-metadata": [[
                    "url": "https://static01.nyt.com/images/2022/06/12/fashion/12VOWS-PRINCESS1/12VOWS-PRINCESS1-thumbStandard.jpg",
                    "format": "Standard Thumbnail",
                    "height": 75,
                    "width": 75
                ]
                ]
            ]]
        ] as [String : Any]
        
        if let art =  try? Article(from: dict) {
            article = art
        }
        XCTAssertEqual(article.getUrlForHeadertring(), "")
    }
    
    
    
    
    
}
