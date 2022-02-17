/// Copyright (c) 2021 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

class Library: ObservableObject {
    var sortedBooks: [LibrarySection: [Book]] {
        let groupedBooks = Dictionary(grouping: booksCache, by: \.readMe)
        return Dictionary(uniqueKeysWithValues: groupedBooks.map {
            (($0.key ? .readMe : .finish), $0.value)
        })
    }
    
    @Published var images: [Book: Image] = [:]
    
    /// An in-memory cache of the manually-sorted books.
    @Published private var booksCache: [Book] = [
        .init(title: "Ein Neues Land", author: "Shaun Tan", microReview: "lorem ipsum sid amed"),
        .init(title: "Dare to Lead", author: "Brené Brown", microReview: "lorem ipsum sid amed"),
        .init(title: "Blasting for Optimum Health Recipe Book", author: "NutriBullet", microReview: "lorem ipsum sid amed"),
        .init(title: "A Guide to Tea", author: "Adagio Teas"),
        .init(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson"),
        .init(title: "Bosch", author: "Laurinda Dixon", microReview: "lorem ipsum sid amed"),
        .init(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington"),
        .init(title: "Drinking with the Saints", author: "Michael P. Foley", microReview: "lorem ipsum sid amed"),
        .init(title: "How to Draw Cats", author: "Janet Rancan", readMe: false),
        .init(title: "Drawing People", author: "Barbara Bradley", readMe: false),
        .init(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter", readMe: false)
    ]
    
    func addNewBook(_ book: Book, image: Image? = nil) {
        booksCache.insert(book, at: 0)
        images[book] = image
    }
}


enum LibrarySection: CaseIterable, CustomStringConvertible {
    case readMe
    case finish
    
    var description: String {
        switch self {
        case .readMe: return "Read Me"
        case .finish: return "Finished Reading"
        }
    }
}
