//
//  bookService.swift
//  GoogleBooks3
//
//  Created by muhammad on 8/17/19
//  Copyright © 2019 muhammad. All rights reserved.
//


import Foundation

typealias BookHandler = ([Book]?) -> Void

final class BookService{
    
    private init () {}
    static let shared = BookService()
    
    func getBooks(with book: String?, completion: @escaping BookHandler){
        
       var myBooks = [Book]()
        
        
        guard let url = URL(string: bookAPI.bookSearchURL(from: book!)) else {
            
            completion([])
            print("Bad URL")
            return
            
        }
         URLSession.shared.dataTask(with: url) { (dat, _, err) in
           
            
            if let error = err {
                
                print("No Data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            if let data = dat {
                
                do {
                    
                    let bookObject = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    
                    guard let books = bookObject["items"] as? [[String:Any]] else {
                        return
                    }
                    
                    for bookDict in books {
                        
                        let book = try Book(json: bookDict)
                        myBooks.append(book!)
                        
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                    completion(myBooks)
                    }
                    
                    
                    
                }catch{
                    
                    print("Couldn't Serialize: \(error.localizedDescription)")
                    completion(nil)
                    
                    return
                }
                

            }
        
        }.resume()
    
    
    }
    
}

