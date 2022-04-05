//
//  Recipe.swift
//  Recipe App
//
//  Created by Octav Radulian on 22.03.2022.
//

import Foundation

// declaring the recipe data structure

class Recipe: Decodable, Identifiable {
    
    var id: UUID?
    
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var highlights:[String]
    var ingredients: [Ingredients]
    var directions: [String]
    
}

// since our json has been updated we need to update the model
class Ingredients: Identifiable, Decodable {
    var id: UUID?
    
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
