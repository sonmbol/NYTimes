//
//  ArticelsSerachTest.swift
//  NYTimesTests
//
//  Created by ahmed abdalla on 11/06/2022.
//

import XCTest
@testable import NYTimes

class ArticelsSerachTest : XCTestCase{

   
    var searchVC : ArticlesSearchViewController!
    var viewModel : ArticlesViewModel!
    var tableViewDelegate: ArticlesDelegate!
    var tableViewDataSource: ArticlesDataSource!
    var tableView : UITableView!
    var searchTableView : UITableView!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        searchVC = storyboard.instantiateViewController(identifier: "kArticlesSearchViewController") as? ArticlesSearchViewController
//        _ = searchVC.view
        viewModel = ArticlesViewModel(delegate: searchVC)
        tableViewDelegate = ArticlesDelegate(viewModel: viewModel)
        tableViewDataSource = ArticlesDataSource(viewModel: viewModel)
        tableView = UITableView()
    }
    
    func testSearchArticles_TableViewShouldNotNill(){
        XCTAssertNotNil(tableView)
    }
    
    func testSearchViewDidloud_setTableViewDataSource(){
        tableView.dataSource = tableViewDataSource
        XCTAssertNotNil(tableView.dataSource)
        XCTAssertTrue(tableView.dataSource is ArticlesDataSource)
    }
    
    func testSearchViewDidloud_setTableViewDelegate(){
        tableView.delegate = tableViewDelegate
        XCTAssertNotNil(tableView.delegate)
        XCTAssertTrue(tableView.delegate is ArticlesDelegate)
    }

    func testTableViewSectionCount_shouldBeOne(){
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfSections, 1)
    }

    func testTableViewRowCount_shouldBeZero(){
        tableView.dataSource = searchVC.tableViewDataSource
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
    }


}
