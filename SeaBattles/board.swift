//
//  board.swift
//  SeaBattles
//
//  Created by Lockwood on 4/19/22.
//

import Foundation

struct board{
    var fleet: Set<Ship> = []
    
    var enemyFleet: Set<Ship> = []
    
    mutating func initBoard(){
        fleet.insert(Ship(col:0,row:0,imageName:"battleshipR"))
       
        fleet.insert(Ship(col:1,row:0,imageName:"carrierR"))
        
        fleet.insert(Ship(col:2,row:0,imageName:"cruiserR"))
        
        fleet.insert(Ship(col:3,row:0,imageName:"destroyerR"))
        
        fleet.insert(Ship(col:4,row:0,imageName:"subR"))
        
    }
    
    mutating func initEnemyBoard(Fleet: Set<Ship>){
        enemyFleet = fleet
        
    }
    
    
    
    func shipAt(col:Int, row:Int) -> Ship?{
        print("Seeking ship at \(col), \(row) from the fleet of \(fleet.count) ships")
        for ship in fleet{
            print("SHIP: \(ship.imageName) COL: \(ship.col) ROW: \(ship.row)")
            if ship.col == col && ship.row == row {
                print("Ship Found \(ship.imageName)")
                return ship
            }
        }
        return nil
    }
    
    mutating func MoveShip(fromCol: Int, fromRow:Int, toCol:Int, toRow:Int){
        guard let movingShip = shipAt(col:fromCol,row:fromRow) else {return}
        
        fleet.remove(movingShip)
        fleet.insert(Ship(col:toCol,row:toRow,imageName:movingShip.imageName))
    }
}
