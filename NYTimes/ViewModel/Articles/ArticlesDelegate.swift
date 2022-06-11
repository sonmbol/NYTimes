//
//  ArticlesDelegate.swift
//  NYTimes
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

class ArticlesDelegate: NSObject, UITableViewDelegate {
    // MARK: - Variables
    let viewModel: ArticlesViewModel
    
    // MARK: - Initialization
    init(viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.itemSelected(at: indexPath)
    }
}
