//
//  DataService.swift
//  Recipe App
//
//  Created by Octav Radulian on 22.03.2022.
//

import Foundation
import SwiftUI

//create a class that wil gather all the data from the local json file
class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        //parse the local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if the pathString is not nil otherwise do...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
           // create a data object
           let data = try Data(contentsOf: url)
            
           let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                    
                    //add unique id for the ingredients of the recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                return recipeData
                
            }
            catch {
                //error with parsing json
                print(error)
            }
            
        }
        catch {
            //error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
    
}
