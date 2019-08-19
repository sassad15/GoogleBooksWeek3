//
//  BookDetailViewController.swift
//  GoogleBooks3
//
//  Created by muhammad on 8/17/19
//  Copyright © 2019 muhammad. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var viewModel: ViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        authorLabel.text = viewModel.currentBook.author
        dateLabel.text = viewModel.currentBook.date
        titleLabel.text = viewModel.currentBook.title
        

        let url = URL(string: viewModel.currentBook.thumbnail)!
        
        URLSession.shared.dataTask(with: url) { (dat, _, _) in
            
            if let data = dat {
                
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        self.thumbnailImage.image = image
                        self.view.layoutIfNeeded()
                        
                    }
                }
            }
            
        }.resume()
        
        
        
    }

}





