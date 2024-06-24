//
//  Sbrain.swift
//  WarShip
//
//  Created by killian on 07/06/2024.
//

import Foundation


func chooseRandomCase(gridSize: Int) -> String {
    let row: [Int]
    let column: [String]
    
    if gridSize == 6 {
        row = [0, 1, 2, 3, 4, 5]
        column = ["A", "B", "C", "D", "E", "F"]
    } else {
        row = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        column = ["A", "B", "C", "D", "E", "F", "G", "H", "K"]
    }
    
    guard let rowChoose = row.randomElement(), let columnChoose = column.randomElement() else {
        return "Error: Unable to choose a random case"
    }
    
    return "\(columnChoose)\(rowChoose)"
}


