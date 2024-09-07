//
//  Player.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-03.
//

import Foundation


struct Player {
    
    var name: String
    var id: Int
    var totalScore: Int = 0
    
    
    mutating func updateScore() {
        
        totalScore += 1
    }
    
    
  
    
}
