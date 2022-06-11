//
//  ArticleCell.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        img.image = nil
        lblTitle.text = ""
        lblDetails.text = ""
        lblDate.text = ""
    }
    
    // MARK: - OUTLET
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    
    func configure(with article: Article){
        lblTitle.text = article.title
        lblDetails.text = article.byline
        lblDate.text = article.date
        if let url = URL(string: article.getUrlForThumbString()){
            img.kf.setImage(with: url)
        }
    }
    
}
