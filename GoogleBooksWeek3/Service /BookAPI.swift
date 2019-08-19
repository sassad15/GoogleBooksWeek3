//
//  BookAPI.swift
//  GoogleBooks3
//
//  Created by muhammad on 8/17/19
//  Copyright © 2019 muhammad. All rights reserved.
//


import Foundation



struct bookAPI {
    
    static let base = "https://www.googleapis.com/books/v1/volumes?q="
    
    
    static func bookSearchURL(from search: String) -> String{
        
       return base + search
    }
    
}

