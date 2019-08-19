//
//  SearchTableViewCell.swift
//  GoogleBooks3
//
//  Created by muhammad on 8/17/19
//  Copyright © 2019 muhammad. All rights reserved.
//


import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    static let identifier = "cellOne"
    
    func configureCell(with book: Book){
        
        
        authorLabel.text = book.author
        publishDateLabel.text = book.date
        titleLabel.text = book.title
        
        
    }
    
}
