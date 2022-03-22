//
//  RecipeModel.swift
//  Recipe App
//
//  Created by Octav Radulian on 22.03.2022.
//

import Foundation

// create the class that will model the data and the UI

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        //create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
}
