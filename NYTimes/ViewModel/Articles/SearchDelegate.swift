//
//  SearchDelegate.swift
//  NYTimes
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

class SearchDelegate: NSObject, UISearchBarDelegate{
    // MARK: - Variables
    let viewModel: ArticlesViewModel
    
    // MARK: - Initialization
    init(viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(for: "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text {
            viewModel.search(for: text)
        }
    }
    
    
}
