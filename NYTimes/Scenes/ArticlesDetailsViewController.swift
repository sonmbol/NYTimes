//
//  ArticlesDetailsViewController.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit
import Kingfisher

class ArticlesDetailsViewController: UIViewController {
    
    // MARK: - Variables
    var article: Article!
    
    // MARK: - Outlets
    @IBOutlet weak var imgArticle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSection: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblBy: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    // MARK: - Update UI
    private func updateUI() {
        lblTitle.text = article.title
        lblSection.text = article.section
        lblDetails.text = article.abstract
        lblDate.text = article.date
        lblBy.text = article.byline
        if let url = URL(string: article.getUrlForHeadertring()){
            imgArticle.kf.setImage(with: url)
        }
        
    }
    
    
}
