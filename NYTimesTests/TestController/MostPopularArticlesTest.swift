//
//  MostPopularArticlesTest.swift
//  NYTimesTests
//
//  Created by ahmed abdalla on 11/06/2022.
//

import XCTest
@testable import NYTimes

class MostPopularArticlesTest: XCTestCase {


    var articlesVC : MostPopularArticlesViewController!
    var viewModel : ArticlesViewModel!
    var tableViewDelegate: ArticlesDelegate!
    var tableViewDataSource: ArticlesDataSource!
    var tableView : UITableView!
    var articlesArray = [Article]()
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        articlesVC = storyboard.instantiateViewController(identifier: "kMostPopularArticlesViewController") as? MostPopularArticlesViewController
//        _ = articlesVC.view
        viewModel = ArticlesViewModel(delegate: articlesVC)
        tableViewDelegate = ArticlesDelegate(viewModel: viewModel)
        tableViewDataSource = ArticlesDataSource(viewModel: viewModel)
        tableView = UITableView()
        
    }
    
    func testArticles_TableViewShouldNotNill(){
        XCTAssertNotNil(tableView)
    }

    func testViewDidloud_setTableViewDataSource(){
        tableView.dataSource = tableViewDataSource
        XCTAssertNotNil(tableView.dataSource)
        XCTAssertTrue(tableView.dataSource is ArticlesDataSource)
    }

    func testViewDidloud_setTableViewDelegate(){
        tableView.delegate = tableViewDelegate
        XCTAssertNotNil(tableView.delegate)
        XCTAssertTrue(tableView.delegate is ArticlesDelegate)
    }

    func testTableViewSectionCount_shouldBeOne(){
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfSections, 1)
    }

    func testTableViewRowCount_shouldBeZero(){
        tableView.dataSource = articlesVC.tableViewDataSource
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
    }

    
    func testArticleRowCount_shouldBeZero(){
        XCTAssertEqual(articlesArray.count, 0)
    }
 
    func testAPICAll_houldBeZero(){
        let expectation = expectation(description: "Response received")
        expectation.assertForOverFulfill = false
        let input = [
            "api-key" : ""
        ]
        NetworkManager.APICall(endUrl: "1.json", input: input, method: .get, headers: nil, type: ArticleData.self) { result in
   
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 60) { (error) in
             if let error = error {
                 // Test failed
            XCTFail("Error: \(error.localizedDescription)")
             }
            XCTAssertEqual(self.articlesArray.count, 0)
         }
    }
    
    func testArticleRowCount_shouldBeTwent(){
        let expectation = expectation(description: "Response received")
        let input = [
            "api-key" : "04ow9TNZmAzAolw2AKLb7dtMMKRjbPb5"
        ]
        NetworkManager.APICall(endUrl: "1.json", input: input, method: .get, headers: nil, type: ArticleData.self) { result in
            switch result {
            case .success((let data,_)):
                if data.status?.uppercased() != "OK" {
                return
                }
                if let art = data.articles{
                self.articlesArray = art
                }
                expectation.fulfill()
                case .failure(let error):
                print(error)
            }
        }
        
        waitForExpectations(timeout: 60) { (error) in
             if let error = error {
                 // Test failed
                 XCTFail("Error: \(error.localizedDescription)")
             }
            
            XCTAssertEqual(self.articlesArray.count, 20)
         }
    }


}
