//
//  Player.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-03.
//

import Foundation


class Player {
    
    var name: String
    var id: Int
    var totalScore: Int = 0
    
    init(name: String, id: Int, totalScore: Int = 0) {
          self.name = name
          self.id = id
          self.totalScore = totalScore
      }
    
     func updateScore() {
        
        totalScore += 1
    }
    
    
    
    
}
