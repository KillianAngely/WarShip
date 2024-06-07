//
//  SetupGameController.swift
//  WarShip
//
//  Created by killian on 07/06/2024.
//

import Foundation
import UIKit

class SetupGameController: UIViewController{
    var gameMode = "IA"
    var difficulty = "EASY"
    
    @IBAction func createGame(_ sender: Any){
        if(chooseGameMode.selectedSegmentIndex == 0){
            gameMode = "IA"
        }else{
            gameMode = "1V1"
        }
        if(chooseDifficultyMode.selectedSegmentIndex == 0){
            difficulty = "EASY"
        }else{
            difficulty = "HARD"
        }
        var gameConfig = [
            "gameMode": gameMode,
            "difficulty":difficulty
        ]
        var gameScreen = (self.storyboard?.instantiateViewController(withIdentifier: "GameController")) as! ManageGameController
        gameScreen.gamedata = gameConfig
        self.navigationController?.pushViewController(gameScreen, animated:true)
    
    }
    @IBOutlet weak var chooseGameMode: UISegmentedControl!
    @IBOutlet weak var chooseDifficultyMode: UISegmentedControl!
}
