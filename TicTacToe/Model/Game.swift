//
//  Game.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-05.
//

import Foundation


class Game {
    
    var player: Player?
    

    
   /*  private */var gameBoard: [Int] = [
                                    0, 0, 0,
                                    0, 0, 0,
                                    0, 0, 0 ]
    
    
    func gameLogic(i: Int, player: Player) {
        
          // Sets the selected square to x or o based on whos playing
        gameBoard[i] = player.id
        
        
         // Check winner
        
        // row 1
        if gameBoard[0] == player.id && gameBoard[1] == player.id && gameBoard[2] == player.id {
            print("Player \(player.name) has won")
        } 
        
        // row 2
        if gameBoard[3] == player.id && gameBoard[4] == player.id && gameBoard[5] == player.id {
            print("Player \(player.name) has won")
        }
        // row 3
        if gameBoard[6] == player.id && gameBoard[7] == player.id && gameBoard[8] == player.id {
            print("Player \(player.name) has won")
        }
        
        // column 1
        if gameBoard[0] == player.id && gameBoard[3] == player.id && gameBoard[6] == player.id {
            print("Player \(player.name) has won")
        }
        // column 2
        if gameBoard[1] == player.id && gameBoard[4] == player.id && gameBoard[7] == player.id {
            print("Player \(player.name) has won")
        }
        
        // column 3
        if gameBoard[2] == player.id && gameBoard[5] == player.id && gameBoard[8] == player.id {
            print("Player \(player.name) has won")
        }

        // diagonal top left to right
        if gameBoard[0] == player.id && gameBoard[4] == player.id && gameBoard[8] == player.id {
            print("Player \(player.name) has won")
        }
        
        // diagonal top right to left
        if gameBoard[2] == player.id && gameBoard[4] == player.id && gameBoard[6] == player.id {
            print("Player \(player.name) has won")
        }
        
        // Check if there is no winner but all the squares
        if !gameBoard.contains(0) {
            
            print("No winner")
        }
        
        
    }
    
    
}
