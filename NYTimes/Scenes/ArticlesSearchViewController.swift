//
//  ArticlesSearchViewController.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//
import UIKit
class ArticlesSearchViewController: UIViewController {
    
    // MARK: - Variables
    var searchController: UISearchController!
    var parentVC: MostPopularArticlesViewController?
    var articlesArray = [Article]()
    var articlesFilterArray = [Article]()
    
    // MARK: - Variables
    var viewModel : ArticlesViewModel!
    var tableViewDelegate: ArticlesDelegate!
    var tableViewDataSource: ArticlesDataSource!
    var searchDelegate: SearchDelegate!
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(cellType: ArticleCell.self)
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async{ [searchController] in
            searchController?.searchBar.becomeFirstResponder()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.searchDismiss()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let viewController = segue.destination as? ArticlesDetailsViewController{
            guard let article = sender as? Article else {
                return
            }
            viewController.article = article
        }
        
    }
    
    
    func setUp(){
        viewModel.delegate = self
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        searchDelegate = SearchDelegate(viewModel: viewModel)
        setupSearchController()
    }
    
    // MARK: - Setup Configuartion for Search Controller
    private func setupSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController?.searchBar.searchTextField.textColor = .white
        searchController?.searchBar.searchTextField.leftView?.tintColor = .white
        searchController?.searchBar.tintColor = .white
        searchController.searchBar.delegate = searchDelegate
        navigationItem.titleView = searchController.searchBar
    }
    
    
    
}



// MARK: - Articles Prtocol
extension ArticlesSearchViewController : ArticlesViewModelEvent {
    
    
    func reloadData() {
        DispatchQueue.main.async{ [tableView] in
            tableView?.reloadData()
        }
    }
    
    func didSelectItem(article: Article) {
        performSegue(withIdentifier: "detailsSegue", sender: article)
    }
    
    
}
