//
//  BookViewModel.swift
//  GoogleBooks3
//
//  Created by muhammad on 8/17/19
//  Copyright © 2019 muhammad. All rights reserved.
//


import Foundation
    
protocol ViewModelDelegate: class {
    func updateView()
}

class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    
    var myBooks = [Book](){
        didSet {
            delegate?.updateView()
        }
    }
    
    var currentBook: Book!
    
    func get(books: String?){
        
        BookService.shared.getBooks(with: books) { [weak self] books in
            
                if let bks =  books {
                    self?.myBooks = bks
                }
            }
        
    }
    
    
}
