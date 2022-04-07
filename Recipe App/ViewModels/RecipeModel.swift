//
//  RecipeModel.swift
//  Recipe App
//
//  Created by Octav Radulian on 22.03.2022.
//

import Foundation
import CoreImage

// create the class that will model the data and the UI

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        //create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
    //method for portion calc
    static func getPortion(ingredient:Ingredients, recipeServings:Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //get a single serving size by multiply denom * recipe servings
            denominator = denominator * recipeServings
            
            //get target portion by multiplying numerator by target servings
            numerator = numerator * targetServings
            
            //reduce fraction by greatest common divisior
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                //calculated the whole portions
                wholePortions = numerator / denominator
                
                //calculated the reminder
                numerator = numerator % denominator
                
                //assign to portion string
                portion += String(wholePortions)
            }
            
            //express the remainder as a fraction
            if numerator > 0 {
                //assign reminder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                
            }
        }
        
        if var unit = ingredient.unit {
            
            var suffix  = ""
            
            // if we need to pluralize
            if wholePortions > 1 {
                //calculate appropiate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit + "s"
                }
            }
            
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            
            return portion + unit
        }
        
        return portion
        
    }
    
}
