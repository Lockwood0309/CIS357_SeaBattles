//
//  ShipDelegate.swift
//  SeaBattles
//
//  Created by Lockwood on 4/18/22.
//

import Foundation

protocol ShipDelegate{
    func MoveShip(fromCol: Int, fromRow:Int, toCol:Int, toRow:Int)
}
