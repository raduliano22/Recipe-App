//
//  Recipe.swift
//  Recipe App
//
//  Created by Octav Radulian on 22.03.2022.
//

import Foundation

// declaring the recipe data structure

class Recipe:Decodable, Identifiable {
    
    var id: UUID?
    
    var name: String
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [String]
    var directions: [String]
    
}
