//
//  BookView.swift
//  ReadMe
//
//  Created by joel Alcantara on 6/1/22.
//

import SwiftUI

extension Book {
    struct Row: View {
        @EnvironmentObject var library: Library
        @ObservedObject var book: Book
        
        var body: some View {
            NavigationLink(destination: BookDetailsView(book: book, image: library.images[book])) {
                HStack {
                    Book.Image(
                        image: library.images[book], title: book.title,
                        width: 80.0, height: 80.0, cornerRadius: 12.0
                    )
                    VStack(alignment: .leading) {
                        TitleAndAuthorView(
                            book: book,
                            titleFont: .title2,
                            authorFont: .title3
                        )
                        if !book.microReview.isEmpty {
                            Text(book.microReview)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    }.lineLimit(1)
                }.padding(.vertical)
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        Book.Row(book: Book(microReview: "a small review"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
