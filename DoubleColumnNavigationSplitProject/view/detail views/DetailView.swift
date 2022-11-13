//
//  DetailView.swift
//  DoubleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        
        if let state = navigationManager.selectionState {
            
            switch state {
                case .movie(let movie):
                    MovieDetailView(movie: movie)
                case .song(let song):
                    SongDetailView(song: song)
                case .book(let book):
                    BookDetailView(book: book)
                case .settings:
                    SettingsView()
            }
            
            
        } else {
            Text("Select something")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(NavigationStateManager())
    }
}
