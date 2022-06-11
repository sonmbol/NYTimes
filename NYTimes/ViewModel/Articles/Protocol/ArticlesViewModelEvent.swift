//
//  ArticlesViewModelEvent.swift
//  NYTimes
//
//  Created by ahmed abdalla on 11/06/2022.
//

import Foundation

protocol ArticlesViewModelEvent :AnyObject {
    func reloadData()
    func didSelectItem(article: Article)
}
