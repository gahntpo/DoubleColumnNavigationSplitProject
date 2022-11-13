//
//  BookDetailView.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: Book
    @EnvironmentObject var navigationManager: NavigationStateManager
    @EnvironmentObject var dataManager: ModelDataManager
    
    var body: some View {
        VStack {
            Text("Book detail view")
            
            Divider()
            
 
            VStack {
                Text("People also liked:")
                    .bold()
                
                ForEach(dataManager.books) { book in
                    Button(book.title) {
                        navigationManager.setSelectedBook(to: book)
                    }
                    
                }
            
            }
    
        }
        .navigationTitle(book.title)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: Book(title: "Alice in Wonderland"))
            .environmentObject(NavigationStateManager())
            .environmentObject(ModelDataManager())
    }
}
