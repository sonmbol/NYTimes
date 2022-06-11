//
//  ArticlesDataSource.swift
//  NYTimes
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit


class ArticlesDataSource: NSObject, UITableViewDataSource {
    // MARK: - Variables
    let viewModel: ArticlesViewModel
    
    // MARK: - Initialization
    init(viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ArticleCell.self,for: indexPath)
        let cellModel = viewModel.dataSet[indexPath.row]
        cell.configure(with: cellModel)
        return cell
    }
}
