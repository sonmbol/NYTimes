//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit



class ArticlesViewModel {
    
    
    // MARK: - Variables
    weak var delegate: ArticlesViewModelEvent?
    var dataSet : [Article] {
        get{
            return isSearch ? articlesFilter : articles
        }
    }
    private var articles :  [Article] = []
    private var articlesFilter : [Article] = []
    private var isSearch = false
    var currentPeriod : ArticlesPeriod? {
        didSet {
            fetchMostPopularArticles()
        }
    }
    var service = NYTimesService()
    
    // MARK: - Initialization
    init(delegate : ArticlesViewModelEvent,currentPeriod : ArticlesPeriod? = .day) {
        self.delegate = delegate
        defer{
            self.currentPeriod = currentPeriod
        }
    }
    
    //MARK: Call Api to get Most Popluar Articles
    private func fetchMostPopularArticles(){
        service.getMostPopularForSection(period: currentPeriod ?? .day) { [weak self] articles in
            if let articles = articles {
                self?.articles = articles
                self?.delegate?.reloadData()
            }
        }
    }
    
    //MARK: Article Selected
    func itemSelected(at indexPath: IndexPath) {
        self.delegate?.didSelectItem(article: dataSet[indexPath.row])
    }
    
    //MARK: Articles Search
    func search(for text: String) {
        DispatchQueue.main.async { [unowned self] in
            articlesFilter.removeAll()
            if text.replacingOccurrences(of: " ", with: "") != ""{
                self.isSearch = true
                for article in self.articles{
                    if article.title?.lowercased().contains(text.lowercased()) ?? false {
                        articlesFilter.append(article)
                    }
                }
            }else{
                self.isSearch = false
            }
            self.delegate?.reloadData()
        }
    }
    
    func searchDismiss() {
        isSearch = false
    }
}
