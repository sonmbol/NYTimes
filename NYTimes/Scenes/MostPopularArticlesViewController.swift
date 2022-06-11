//
//  MostPopularArticlesViewController.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit
import DropDown


class MostPopularArticlesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(cellType: ArticleCell.self)
        }
    }
    @IBOutlet weak var barItemFilter: UIBarButtonItem!
    
    // MARK: - Variables
    private var viewModel : ArticlesViewModel!
    var tableViewDelegate: ArticlesDelegate!
    var tableViewDataSource: ArticlesDataSource!
    let periodDropDown = DropDown()
    let PERIOD = ArticlesPeriod.allCases
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = ArticlesViewModel(delegate: self)
        tableViewDelegate = ArticlesDelegate(viewModel: viewModel)
        tableViewDataSource = ArticlesDataSource(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        configureFieldDropDown()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let viewController = segue.destination as? ArticlesSearchViewController{
            viewController.viewModel = viewModel
            viewController.tableViewDataSource = tableViewDataSource
            viewController.tableViewDelegate = tableViewDelegate
            
        }
        if let viewController = segue.destination as? ArticlesDetailsViewController{
            guard let article = sender as? Article else {
                return
            }
            viewController.article = article
        }
        
    }
    
    // MARK: - IBAction
    
    // Search Button tapped
    @IBAction func search(){
        performSegue(withIdentifier: "searchSeque", sender: nil)
    }
    
    // Filter to change period
    @IBAction func showFilter(){
        periodDropDown.show()
    }
    
    //MARK: Fill Data to Drop List
    func configureFieldDropDown(){
        periodDropDown.custompStyle()
        periodDropDown.anchorView = barItemFilter
        periodDropDown.width = 200
        periodDropDown.dataSource.removeAll()
        for p in PERIOD{
            periodDropDown.dataSource.append(p.description)
        }
        // Action triggered on selection
        periodDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.viewModel?.currentPeriod = PERIOD[index]
        }
        
    }
    
}

// MARK: - Outlets
extension MostPopularArticlesViewController : ArticlesViewModelEvent {
    
    
    func reloadData() {
        DispatchQueue.main.async{ [tableView] in
            tableView?.reloadData()
        }
    }
    
    func didSelectItem(article: Article) {
        performSegue(withIdentifier: "detailsSegue", sender: article)
    }
    
    
    
}
