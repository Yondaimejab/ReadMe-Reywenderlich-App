//
//  BookView.swift
//  ReadMe
//
//  Created by joel Alcantara on 6/1/22.
//

import SwiftUI

extension Book {
    struct Row: View {
        let book: Book
        
        var body: some View {
            HStack {
                Book.Image(title: Book().title)
                VStack(alignment: .leading, spacing: 5) {
                    Text(book.title)
                        .font(.title2)
                    Text(book.author)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}


struct BookView: View {
    var body: some View {
        HStack {
            Book.Image(title: Book().title)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.title2)
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        Book.Row(book: Book())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
