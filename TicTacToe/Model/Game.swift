//
//  Game.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-05.
//

import Foundation


class Game {
    
    var player: Player?
    

    
   /*  private */var gameBoard: [Int] = [0, 0, 0,
                                    0, 0, 0,
                                    0, 0, 0]
    
    
    func gameLogic(indexMove: Int, player: Player) {
        

            
        gameBoard[indexMove] = player.id
        
        
    }
    
    
}
