//
//  CreateBookView.swift
//  ReadMe
//
//  Created by joel Alcantara on 8/1/22.
//

import SwiftUI

struct CreateBookView: View {
    @EnvironmentObject var library: Library
    @Environment(\.dismiss) var shouldDismiss
    @ObservedObject private var book: Book = .init()
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Text("Title")
                TextField("Title", text: $book.title)
            }
            HStack(spacing: 10) {
                Text("Author")
                TextField("Author", text: $book.author)
            }
            if let book = book {
                EditableBookSectionView(book: book, image: $image)
            }
        }.padding()
            .navigationTitle("Got a new Book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        library.addNewBook(book, image: image)
                        shouldDismiss()
                    }, label: { Text("Add To Library") })
                        .disabled([book.title, book.author].contains(where: { $0.isEmpty }))
                }
            }
    }
}

struct CreateBookView_Previews: PreviewProvider {
    static var previews: some View {
        CreateBookView().environmentObject(Library())
    }
}
