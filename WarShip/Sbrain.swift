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
        row = [0, 1, 2Ï, 3, 4, 5]
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

func generateShip(gridSize: Int) -> [String: [String]] {
    let directions = ["horizontal", "vertical"]
    let lengths = [2, 3]
    let rows = Array(0..<gridSize)
    let columns = (0..<gridSize).map { String(UnicodeScalar("A".unicodeScalars.first!.value + UInt32($0))!) }
    
    var shipCoordinates = [String]()
    var shipPlaced = false
    
    while !shipPlaced {
        guard let startRow = rows.randomElement(), let startColumn = columns.randomElement(), let direction = directions.randomElement(), let length = lengths.randomElement() else {
            continue
        }
        
        shipCoordinates.removeAll()
        var isValidPlacement = true
        
        for i in 0..<length {
            if direction == "horizontal" {
                if let colIndex = columns.firstIndex(of: startColumn), colIndex + i < gridSize {
                    shipCoordinates.append("\(columns[colIndex + i])\(startRow)")
                } else {
                    isValidPlacement = false
                    break
                }
            } else {
                if startRow + i < gridSize {
                    shipCoordinates.append("\(startColumn)\(startRow + i)")
                } else {
                    isValidPlacement = false
                    break
                }
            }
        }
        
        if isValidPlacement {
            shipPlaced = true
        }
    }
    
    return ["ship": shipCoordinates]
}
