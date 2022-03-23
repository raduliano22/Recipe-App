//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Octav Radulian on 23.03.2022.
//

import SwiftUI

//Adding the tab view and changing the starting point of the app

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            
            VStack {
                Text("First tab")
                
            }.tabItem {
                Text("Favourites")
                Image(systemName: "star")
            }
            
            VStack {
                RecipeListView()
            }.tabItem {
                Text("Recipes")
                Image(systemName: "list.bullet")
            }
            
        }
        
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
