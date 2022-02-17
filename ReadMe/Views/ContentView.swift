    //
    //  ContentView.swift
    //  ReadMe
    //
    //  Created by joel Alcantara on 6/1/22.
    //

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var library: Library
    @State private var isCreatingBook: Bool = .init(booleanLiteral: false)
    
    var body: some View {
        NavigationView {
            List {
                Button(action: { isCreatingBook.toggle() }, label: {
                    HStack(alignment: .center) {
                        Spacer()
                        VStack(spacing: 6) {
                            Image(systemName: "book.circle")
                                .font(.system(size: 60))
                            Text("Add New Book").font(.title2)
                        }
                        Spacer()
                    }.padding(.vertical, 8)
                })
                ForEach(LibrarySection.allCases, id: \.self) { section in
                    SectionView(section: section)
                }
            }
            .navigationTitle("My Library")
            .sheet(isPresented: $isCreatingBook) {
                NavigationView { CreateBookView() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInAllColorSchemes
    }
}
