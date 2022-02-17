//
//  Book.swift
//  ReadMe
//
//  Created by joel Alcantara on 6/1/22.
//

import Foundation
import Combine

class Book: Hashable, Identifiable, ObservableObject {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs === rhs
    }
    
    @Published var title: String
    @Published var author: String
    @Published var microReview: String
    @Published var readMe: Bool
    
    init(title: String = "", author: String = "", microReview: String = "", readMe: Bool = true) {
        self.title = title
        self.author = author
        self.microReview = microReview
        self.readMe = readMe
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
