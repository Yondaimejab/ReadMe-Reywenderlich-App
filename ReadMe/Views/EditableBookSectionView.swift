//
//  EditableBookSectionView.swift
//  ReadMe
//
//  Created by joel Alcantara on 8/1/22.
//

import Foundation
import SwiftUI
import PhotosUI

struct EditableBookSectionView: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    @State private var showConfirmation: Bool = .init(booleanLiteral: false)
    @State private var showImagePicker: Bool = .init(booleanLiteral: false)
    
    var body: some View {
        VStack {
            VStack {
                Divider().padding(.vertical)
                TextField("Review...", text: $book.microReview)
                Divider().padding(.vertical)
            }.padding(.horizontal)
            Book.Image(image: image, title: book.title, cornerRadius: 12.0)
                .scaledToFit()
                .padding([.horizontal, .top])
            HStack {
                if image != nil {
                    Spacer()
                    Button(action: { showConfirmation = true }) {
                        HStack {
                            Image(systemName: "trash")
                            Text("Delete Image")
                        }
                    }
                    
                }
                Spacer()
                Button("Upload Image...") {
                    showImagePicker = true
                }
                Spacer()
            }.padding(.vertical)
        }.sheet(isPresented: $showImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog(
            "Delete image for \(book.title)",
            isPresented: $showConfirmation
        ) {
            Button("Delete", role: .destructive) {
                image = nil
            }
        } message: {
            Text("Delete image for \(book.title)")
        }
    }
}
