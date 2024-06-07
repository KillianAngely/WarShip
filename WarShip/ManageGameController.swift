//
//  ManageGameController.swift
//  WarShip
//
//  Created by killian on 07/06/2024.
//

import Foundation
import UIKit

class ManageGameController: UIViewController {
    var gamedata: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Utilisation de if let pour un déballage optionnel sécurisé
        guard let gameMode = gamedata?["gameMode"] else {
            // game is not set
            return
        }
        if(gameMode == "IA"){
            //placement random next vue
        }
        if(gameMode == "1V1"){
            //placement random manuel
        }
        
        
        guard let difficulty = gamedata?["difficulty"] else {
            // difficulty is not set
            return
        }
        if(difficulty == "EASY"){
            //create a grid 6 by 6
        }
        if(difficulty == "HARD"){
            //create a grid 9 by 9
        }
        
    }
    }
