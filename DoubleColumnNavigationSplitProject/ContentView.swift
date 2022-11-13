//
//  ContentView.swift
//  DoubleColumnNavigationSplitProject
//
//  Created by Karin Prater on 13.11.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var dataManager = ModelDataManager()
    @StateObject var navigationStateManager = NavigationStateManager()
    
    @SceneStorage("navigationState") var navigationStateData: Data?
    
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            DetailView()
        }
        
        .environmentObject(dataManager)
        .environmentObject(navigationStateManager)
        
        .onAppear {
            //reset during launch
            navigationStateManager.data = navigationStateData
        }
        .onReceive(navigationStateManager.$selectionState.dropFirst()) { _ in
            // save state to usedefaults
            navigationStateData = navigationStateManager.data
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
