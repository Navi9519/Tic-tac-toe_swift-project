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
    
    
    func checkWinner(index: Int, player: Player) -> Bool {
        
        // Sets the selected square to x or o based on whos playing
       
        gameBoard[index] = player.id
        
        
        // Check winner
        
        // row 1
        if gameBoard[0] == player.id && gameBoard[1] == player.id && gameBoard[2] == player.id {
            
            return true
            
            
            
        }
        
        // row 2
        if gameBoard[3] == player.id && gameBoard[4] == player.id && gameBoard[5] == player.id {
            
            
            return true
            
            
        }
        // row 3
        if gameBoard[6] == player.id && gameBoard[7] == player.id && gameBoard[8] == player.id {
            
            //  print("Player \(player.name) has won and has won \(player.totalScore) times")
            return true
            
            
        }
        
        // column 1
        if gameBoard[0] == player.id && gameBoard[3] == player.id && gameBoard[6] == player.id {
            
            // print("Player \(player.name) has won and has won \(player.totalScore) times")
            return true
            
        }
        // column 2
        if gameBoard[1] == player.id && gameBoard[4] == player.id && gameBoard[7] == player.id {
            
            //print("Player \(player.name) has won and has won \(player.totalScore) times")
            return true
            
        }
        
        // column 3
        if gameBoard[2] == player.id && gameBoard[5] == player.id && gameBoard[8] == player.id {
            
            // print("Player \(player.name) has won and has won \(player.totalScore) times")
            return true
            
        }
        
        // diagonal top left to right
        if gameBoard[0] == player.id && gameBoard[4] == player.id && gameBoard[8] == player.id {
            
            // print("Player \(player.name) has won and has won \(player.totalScore) times")
            return true
            
        }
        
        // diagonal top right to left
        if gameBoard[2] == player.id && gameBoard[4] == player.id && gameBoard[6] == player.id {
            
            // print("Player \(player.name) has won and has won \(player.totalScore) times")
            return true
            
        }
        
        
        
        return false
        
    }
    
    
    func resetBoard() {
        
        gameBoard = [
            0, 0, 0,
            0, 0, 0,
            0, 0, 0
        ]
    }
    
    
    
}
