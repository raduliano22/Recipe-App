//
//  RecipeHighlights.swift
//  Recipe App
//
//  Created by Octav Radulian on 07.04.2022.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        
        //loop through the highlights and build the tring
        for index in 0..<highlights.count {
            
            //if is last item don't add comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1, test2, text3"])
        }
    }
}
