//
//  SectionView.swift
//  ReadMe
//
//  Created by joel Alcantara on 17/2/22.
//

import SwiftUI

struct SectionView: View {
    @EnvironmentObject var library: Library
    let section: LibrarySection
    
    var body: some View {
        if let books = library.sortedBooks[section] {
            Section(content: {
                ForEach(books) { book in
                    Book.Row(book: book)
                }
            }, header: {
                ZStack {
                    Image("BookTexture")
                        .resizable()
                        .frame(maxHeight: 80)
                        .cornerRadius(10)
                    VStack {
                        Text(section.description)
                            .font(.title)
                    }.padding(5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                }
            })
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: .readMe)
    }
}
