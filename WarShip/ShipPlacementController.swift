//
//  ShipPlacementController.swift
//  WarShip
//
//  Created by killian on 07/06/2024.
//

import Foundation
import UIKit


class ShipPlacementController : UIViewController {
    var setupGameData: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let gameMode = setupGameData?["gameMode"], let difficulty = setupGameData?["difficulty"] else {
            return
        }
        
        let gridSize: Int
        if( difficulty == "EASY")
        {
            gridSize = 6
        }else{
            gridSize = 9
        }
        if(gameMode == "IA"){
        var selection :[String] = []
            repeat {
                let result = chooseRandomCase(gridSize: gridSize)
                selection.append(result)
            } while selection.count != 3
        print(selection)
        //start Game
        }else{
            //start selection game
            //creer des button
            
        }
        
    }
    
    
}
