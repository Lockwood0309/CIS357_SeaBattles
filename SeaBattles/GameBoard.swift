//
//  GameBoard.swift
//  SeaBattles
//
//  Created by Lockwood on 4/16/22.
//

import UIKit

class GameBoard: UIView {

    let orginX:CGFloat = 0
    let orginY:CGFloat = 0
    let cellSideX:CGFloat = 37.4
    let cellSideY:CGFloat = 36.0
    
    var fromCol:Int = -1
    var fromRow:Int = -1
    
    var fleet: Set<Ship> = []
    var shipDelegate: ShipDelegate?

//    func initBoard(){
//        fleet.insert(Ship(col:0,row:0,imageName:"battleshipR"))
//
//        fleet.insert(Ship(col:1,row:0,imageName:"carrierR"))
//
//        fleet.insert(Ship(col:2,row:0,imageName:"cruiserR"))
//
//        fleet.insert(Ship(col:3,row:0,imageName:"destroyerR"))
//
//        fleet.insert(Ship(col:4,row:0,imageName:"subR"))
//
//    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        drawBoard()
        placeShips()

    }
    
    func placeShips(){
//        fleet.insert(Ship(col:0,row:0,imageName:"battleshipR"))
////        print("battleshipR Inserted")
//        fleet.insert(Ship(col:1,row:0,imageName:"carrierR"))
////        print("carrierR Inserted")
//        fleet.insert(Ship(col:2,row:0,imageName:"cruiserR"))
////        print("cruiserR Inserted")
//        fleet.insert(Ship(col:3,row:0,imageName:"destroyerR"))
////        print("destroyerR Inserted")
//        fleet.insert(Ship(col:4,row:0,imageName:"subR"))
//        print("subR Inserted")
        
        for ship in fleet{
            drawShipAt(col: ship.col, row: ship.row, imageName: ship.imageName)
        }
        print("Fleet size \(fleet.count)")
//        let Battleship = UIImage(named: "battleshipR")
//        Battleship?.draw(at: CGPoint(x:0*cellSideX,y:0*cellSideY))
//        drawShipAt(col:0,row:0,imageName:"battleshipR")
//
////        let Carrier = UIImage(named: "carrierR")
////        Carrier?.draw(at: CGPoint(x:1*cellSideX,y:0*cellSideY))
//        drawShipAt(col:1,row:0,imageName:"carrierR")
//
////        let Cruiser = UIImage(named: "cruiserR")
////        Cruiser?.draw(at: CGPoint(x:2*cellSideX,y:0*cellSideY))
//        drawShipAt(col:2,row:0,imageName:"cruiserR")
//
////        let Destroyer = UIImage(named: "destroyerR")
////        Destroyer?.draw(at: CGPoint(x:3*cellSideX,y:0*cellSideY))
//        drawShipAt(col:3,row:0,imageName:"destroyerR")
////        let Submarine = UIImage(named: "subR")
////        Submarine?.draw(at: CGPoint(x:4*cellSideX,y:0*cellSideY))
//        drawShipAt(col:4,row:0,imageName:"subR")
    }
    
    func drawShipAt(col:Int, row:Int, imageName:String){
        let ship = UIImage(named: imageName)
        ship?.draw(at: CGPoint(x:CGFloat(col)*cellSideX,y:CGFloat(row)*cellSideY))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        fromCol = Int(fingerLocation.x/cellSideX)
        fromRow = Int(fingerLocation.y/cellSideY)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        let toCol: Int = Int(fingerLocation.x/cellSideX)
        let toRow: Int = Int(fingerLocation.y/cellSideY)
        print("from (\(fromCol), \(fromRow), to \(toCol), \(toRow))")
        shipDelegate?.MoveShip(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
    
    func drawBoard(){
        drawSquare(col:0, row:0, color:UIColor.gray)
        drawSquare(col:1, row:0, color:UIColor.lightGray)
        drawSquare(col:2, row:0, color:UIColor.gray)
        drawSquare(col:3, row:0, color:UIColor.lightGray)
        drawSquare(col:4, row:0, color:UIColor.gray)
        drawSquare(col:5, row:0, color:UIColor.lightGray)
        drawSquare(col:6, row:0, color:UIColor.gray)
        drawSquare(col:7, row:0, color:UIColor.lightGray)
        drawSquare(col:8, row:0, color:UIColor.gray)
        drawSquare(col:9, row:0, color:UIColor.lightGray)
        
        drawSquare(col:0, row:1, color:UIColor.lightGray)
        drawSquare(col:1, row:1, color:UIColor.gray)
        drawSquare(col:2, row:1, color:UIColor.lightGray)
        drawSquare(col:3, row:1, color:UIColor.gray)
        drawSquare(col:4, row:1, color:UIColor.lightGray)
        drawSquare(col:5, row:1, color:UIColor.gray)
        drawSquare(col:6, row:1, color:UIColor.lightGray)
        drawSquare(col:7, row:1, color:UIColor.gray)
        drawSquare(col:8, row:1, color:UIColor.lightGray)
        drawSquare(col:9, row:1, color:UIColor.gray)

        drawSquare(col:0, row:2, color:UIColor.gray)
        drawSquare(col:1, row:2, color:UIColor.lightGray)
        drawSquare(col:2, row:2, color:UIColor.gray)
        drawSquare(col:3, row:2, color:UIColor.lightGray)
        drawSquare(col:4, row:2, color:UIColor.gray)
        drawSquare(col:5, row:2, color:UIColor.lightGray)
        drawSquare(col:6, row:2, color:UIColor.gray)
        drawSquare(col:7, row:2, color:UIColor.lightGray)
        drawSquare(col:8, row:2, color:UIColor.gray)
        drawSquare(col:9, row:2, color:UIColor.lightGray)

        drawSquare(col:0, row:3, color:UIColor.lightGray)
        drawSquare(col:1, row:3, color:UIColor.gray)
        drawSquare(col:2, row:3, color:UIColor.lightGray)
        drawSquare(col:3, row:3, color:UIColor.gray)
        drawSquare(col:4, row:3, color:UIColor.lightGray)
        drawSquare(col:5, row:3, color:UIColor.gray)
        drawSquare(col:6, row:3, color:UIColor.lightGray)
        drawSquare(col:7, row:3, color:UIColor.gray)
        drawSquare(col:8, row:3, color:UIColor.lightGray)
        drawSquare(col:9, row:3, color:UIColor.gray)

        drawSquare(col:0, row:4, color:UIColor.gray)
        drawSquare(col:1, row:4, color:UIColor.lightGray)
        drawSquare(col:2, row:4, color:UIColor.gray)
        drawSquare(col:3, row:4, color:UIColor.lightGray)
        drawSquare(col:4, row:4, color:UIColor.gray)
        drawSquare(col:5, row:4, color:UIColor.lightGray)
        drawSquare(col:6, row:4, color:UIColor.gray)
        drawSquare(col:7, row:4, color:UIColor.lightGray)
        drawSquare(col:8, row:4, color:UIColor.gray)
        drawSquare(col:9, row:4, color:UIColor.lightGray)

        drawSquare(col:0, row:5, color:UIColor.lightGray)
        drawSquare(col:1, row:5, color:UIColor.gray)
        drawSquare(col:2, row:5, color:UIColor.lightGray)
        drawSquare(col:3, row:5, color:UIColor.gray)
        drawSquare(col:4, row:5, color:UIColor.lightGray)
        drawSquare(col:5, row:5, color:UIColor.gray)
        drawSquare(col:6, row:5, color:UIColor.lightGray)
        drawSquare(col:7, row:5, color:UIColor.gray)
        drawSquare(col:8, row:5, color:UIColor.lightGray)
        drawSquare(col:9, row:5, color:UIColor.gray)

        drawSquare(col:0, row:6, color:UIColor.gray)
        drawSquare(col:1, row:6, color:UIColor.lightGray)
        drawSquare(col:2, row:6, color:UIColor.gray)
        drawSquare(col:3, row:6, color:UIColor.lightGray)
        drawSquare(col:4, row:6, color:UIColor.gray)
        drawSquare(col:5, row:6, color:UIColor.lightGray)
        drawSquare(col:6, row:6, color:UIColor.gray)
        drawSquare(col:7, row:6, color:UIColor.lightGray)
        drawSquare(col:8, row:6, color:UIColor.gray)
        drawSquare(col:9, row:6, color:UIColor.lightGray)

        drawSquare(col:0, row:7, color:UIColor.lightGray)
        drawSquare(col:1, row:7, color:UIColor.gray)
        drawSquare(col:2, row:7, color:UIColor.lightGray)
        drawSquare(col:3, row:7, color:UIColor.gray)
        drawSquare(col:4, row:7, color:UIColor.lightGray)
        drawSquare(col:5, row:7, color:UIColor.gray)
        drawSquare(col:6, row:7, color:UIColor.lightGray)
        drawSquare(col:7, row:7, color:UIColor.gray)
        drawSquare(col:8, row:7, color:UIColor.lightGray)
        drawSquare(col:9, row:7, color:UIColor.gray)

        drawSquare(col:0, row:8, color:UIColor.gray)
        drawSquare(col:1, row:8, color:UIColor.lightGray)
        drawSquare(col:2, row:8, color:UIColor.gray)
        drawSquare(col:3, row:8, color:UIColor.lightGray)
        drawSquare(col:4, row:8, color:UIColor.gray)
        drawSquare(col:5, row:8, color:UIColor.lightGray)
        drawSquare(col:6, row:8, color:UIColor.gray)
        drawSquare(col:7, row:8, color:UIColor.lightGray)
        drawSquare(col:8, row:8, color:UIColor.gray)
        drawSquare(col:9, row:8, color:UIColor.lightGray)

        drawSquare(col:0, row:9, color:UIColor.lightGray)
        drawSquare(col:1, row:9, color:UIColor.gray)
        drawSquare(col:2, row:9, color:UIColor.lightGray)
        drawSquare(col:3, row:9, color:UIColor.gray)
        drawSquare(col:4, row:9, color:UIColor.lightGray)
        drawSquare(col:5, row:9, color:UIColor.gray)
        drawSquare(col:6, row:9, color:UIColor.lightGray)
        drawSquare(col:7, row:9, color:UIColor.gray)
        drawSquare(col:8, row:9, color:UIColor.lightGray)
        drawSquare(col:9, row:9, color:UIColor.gray)
    }
    
    func drawSquare(col:Int, row:Int, color:UIColor){
        let path = UIBezierPath(rect:CGRect(x:orginX + CGFloat(col) * cellSideX, y:orginY + CGFloat(row) * cellSideY, width:cellSideX,height:cellSideY))
        color.setFill()
        path.fill()
    }

}
