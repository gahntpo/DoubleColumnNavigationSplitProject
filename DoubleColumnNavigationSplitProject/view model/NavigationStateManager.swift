//
//  NavigationStateManager.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import Foundation
import Combine

enum SelectionState: Hashable, Codable {
    case movie(Movie)
    case song(Song)
    case book(Book)
    case settings
}

class NavigationStateManager: ObservableObject {
    
    @Published var selectionState: SelectionState? = nil
    
    
    var data: Data? {
        get {
           try? JSONEncoder().encode(selectionState)
        }
        set {
            
            guard let data = newValue,
                  let selectionState = try? JSONDecoder().decode(SelectionState.self, from: data) else {
                return
            }
            
            // fetch updated new model data for each id
            self.selectionState = selectionState
        }
    }
    
    
    func popToRoot() {
       selectionState = nil
    }
    
    func goToSettings() {
        selectionState = .settings
    }
    
    func setSelectedBook(to book: Book) {
        selectionState = .book(book)
    }
    
    func setSelectedSong(to song: Song) {
        selectionState = .song(song)
    }
    
    
    var objectWillChangeSequence: AsyncPublisher<Publishers.Buffer<ObservableObjectPublisher>> {
        objectWillChange
            .buffer(size: 1, prefetch: .byRequest, whenFull: .dropOldest)
            .values
    }
}
