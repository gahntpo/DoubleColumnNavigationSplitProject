//
//  SidebarView.swift
//  DoubleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

struct SidebarView: View {
    
    @EnvironmentObject var dataManager: ModelDataManager
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        
        List(selection: $navigationManager.selectionState) {
            
            Section("Books") {
                ForEach(dataManager.books) { book in
                    Button(book.title) {
                        navigationManager.selectionState = SelectionState.book(book)
                    }
                }
            }
            
            Section("Songs") {
                ForEach(dataManager.songs) { song in
                    Text(song.title)
                        .tag(SelectionState.song(song))
                }
            }
            
            Section("Movie") {
                ForEach(dataManager.movies) { movie in
                    NavigationLink(movie.title, value: SelectionState.movie(movie))
                }
            }
            
            Text("Settings")
                .tag(SelectionState.settings)
            
        }
        #if os(iOS)
        .listStyle(.grouped)
        #else
        .listStyle(.sidebar)
        #endif
        .navigationTitle("Sidebar")
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
            .environmentObject(ModelDataManager())
            .environmentObject(NavigationStateManager())
    }
}
