//
//  BookImage.swift
//  ReadMe
//
//  Created by joel Alcantara on 6/1/22.
//

import SwiftUI

extension Book {
    struct Image: View {
        let image: SwiftUI.Image?
        var title: String
        var width: CGFloat? = nil
        var height: CGFloat? = nil
        var cornerRadius = 16.0
        
        var body: some View {
            if let image = image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .cornerRadius(21)
            } else {
                let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "book")
                    symbol.resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .foregroundColor(.secondary.opacity(cornerRadius))
            }
        }
    }
}

extension Image {
    init?(title: String) {
        guard let character = title.first,
              case let symbolName = "\(character.lowercased()).square",
              UIImage(systemName: symbolName) != nil else { return nil }
        self.init(systemName: symbolName)
    }
}

extension Book.Image {
    init(title: String) {
        self.init(image: nil, title: title)
    }
}

extension View {
    var previewInAllColorSchemes: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: preferredColorScheme)
    }
}

struct BookImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title).previewLayout(.sizeThatFits)
            Book.Image(title: "").previewLayout(.sizeThatFits)
            Book.Image(title: "😁").previewLayout(.sizeThatFits)
        }
    }
}
