//
//  Book.swift
//  GoogleBooks3
//
//  Created by muhammad on 8/17/19
//  Copyright © 2019 muhammad. All rights reserved.
//


import Foundation



enum errorMessage: Error {
    case notFound(String)
}



class Book: Decodable{
    
    var author: String
    var date: String!
    var title: String
    var thumbnail: String!
    
    init?(json: [String:Any]) throws {
        
        
        
        guard let volumeInfo =  json["volumeInfo"] as? [String:Any] else {throw errorMessage.notFound("volumeInfo not found")}

        guard let authors = volumeInfo["authors"] as? [String] else {throw  errorMessage.notFound("missing authors")}
        
        guard let imageLinks = volumeInfo["imageLinks"] as? [String:String] else {throw errorMessage.notFound("imageLinks not found")}

        self.author = authors[0]
        self.date = volumeInfo["publishedDate"] as? String
        self.title = volumeInfo["title"] as! String
        self.thumbnail = imageLinks["thumbnail"]

    }
    
    
   
}
