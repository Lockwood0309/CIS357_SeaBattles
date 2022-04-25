//
//  SeaBattlesViewController.swift
//  SeaBattles
//
//  Created by Lockwood on 4/18/22.
//

import Foundation
import UIKit

class SeaBattlesViewController: UIViewController, ShipDelegate {
    
    var gameboard = board()
    
    var enemyGameboard = board()
    
    @IBOutlet weak var playerGameBoard: GameBoard!
    
    
    @IBAction func StartClicked(_ sender: Any) {
    // Send start to enemey player
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerGameBoard.shipDelegate = self
        
        gameboard.initBoard()
        
        //gameboard.MoveShip(fromCol: 0, fromRow: 0, toCol: 0, toRow: 1)
        
        playerGameBoard.fleet = gameboard.fleet
        
        
        
        playerGameBoard.setNeedsDisplay()
    }
    
    func MoveShip(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        gameboard.MoveShip(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        playerGameBoard.fleet = gameboard.fleet
        playerGameBoard.setNeedsDisplay(playerGameBoard.bounds)
    }
}
