//
//  ManageGameController.swift
//  WarShip
//
//  Created by killian on 07/06/2024.
//

import UIKit

class ManageGameController: UIViewController {
    var gamedata: [String: String]?
    var gridView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let gameMode = gamedata?["gameMode"], let difficulty = gamedata?["difficulty"] else {
            return
        }
        
        setupUI()
        
        let gridSize: Int
        switch difficulty {
        case "EASY":
            gridSize = 6
        case "HARD":
            gridSize = 9
        default:
            gridSize = 6
        }
        
        setupGrid(size: gridSize)
        
        if gameMode == "IA" {
            // Placement random pour IA
        } else if gameMode == "1V1" {
            // Placement manuel pour 1v1
        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        title = "Game Screen"
    }
    
    func setupGrid(size: Int) {
        let cellSize: CGFloat = 30.0
        let cellSpacing: CGFloat = 1.0
        let gridSize = CGFloat(size)
        
        gridView = UIView()
        gridView.translatesAutoresizingMaskIntoConstraints = false
        gridView.backgroundColor = UIColor.darkGray
        view.addSubview(gridView)
        
        NSLayoutConstraint.activate([
            gridView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gridView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gridView.widthAnchor.constraint(equalToConstant: gridSize * (cellSize + cellSpacing) + cellSpacing),
            gridView.heightAnchor.constraint(equalToConstant: gridSize * (cellSize + cellSpacing) + cellSpacing)
        ])
        
        for row in 0..<size {
            for col in 0..<size {
                let cellButton = UIButton(type: .system)
                cellButton.layer.borderWidth = 1
                cellButton.layer.borderColor = UIColor.black.cgColor
                cellButton.backgroundColor = .white
                cellButton.translatesAutoresizingMaskIntoConstraints = false
                cellButton.tag = row * size + col
                cellButton.addTarget(self, action: #selector(cellTapped(_:)), for: .touchUpInside)
                gridView.addSubview(cellButton)
                
                NSLayoutConstraint.activate([
                    cellButton.widthAnchor.constraint(equalToConstant: cellSize),
                    cellButton.heightAnchor.constraint(equalToConstant: cellSize),
                    cellButton.leadingAnchor.constraint(equalTo: gridView.leadingAnchor, constant: CGFloat(col) * (cellSize + cellSpacing) + cellSpacing),
                    cellButton.topAnchor.constraint(equalTo: gridView.topAnchor, constant: CGFloat(row) * (cellSize + cellSpacing) + cellSpacing)
                ])
            }
        }
    }
    
    @objc func cellTapped(_ sender: UIButton) {
        let selectedCellsCount = gridView.subviews.filter {( $0 as? UIButton)?.backgroundColor == .purple }.count

        if selectedCellsCount >= 3 && sender.backgroundColor != .purple {
            return
        }
        
        sender.backgroundColor = (sender.backgroundColor == .purple) ? .white : .purple
    }
    @IBAction func Play(_ sender: Any) {
        let warGameScreen = (self.storyboard?.instantiateViewController(withIdentifier: "inGameController")) as! InGameController
        self.navigationController?.pushViewController(warGameScreen, animated:true)
        
    }
}
