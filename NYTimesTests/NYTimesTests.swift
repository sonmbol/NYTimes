//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by ahmed abdalla on 10/06/2022.
//

import XCTest
@testable import NYTimes

class NYTimesTests: XCTestCase {

    
    override func setUp() {
        super.setUp()
     let view = UIView()
        view.cornerRadius = 20
        XCTAssertEqual(view.cornerRadius, 20)
        XCTAssertNotEqual(Environment.baseURL, "")
        XCTAssertNotEqual(Environment.apiKey, "")
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension Decodable {
  init(from: Any) throws {
    let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:sszzz"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    self = try decoder.decode(Self.self, from: data)
  }
}

