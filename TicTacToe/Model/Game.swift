//
//  Game.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-05.
//

import Foundation


class Game {
    
    var player: Player?
    
    
    var gameBoard: [Int] = [
        0, 0, 0,
        0, 0, 0,
        0, 0, 0 ]
    
    var winningConditions = [
      [0, 1, 2], // row 1
      [3, 4, 5], // row 2
      [6, 7, 8], // row 3
      [0, 3, 6], // column 1
      [1, 4, 7], // column 2
      [2, 5, 8], // column 3
      [0, 4, 8], // diagonal top left to right
      [2, 4, 6], // diagonal top right to left
    ];
    
 
    
    
    
    func checkWinner(index: Int, player: Player) -> Bool {
        
        // Sets the selected square to x or o based on whos playing
        
        gameBoard[index] = player.id
        
            
     
        // Check Winner
        for (line) in winningConditions {
            
            let (a, b, c) = (line[0], line[1], line[2])
            
            if(gameBoard[a] != 0 && gameBoard[a] == gameBoard[b] && gameBoard[a] == gameBoard[c]) {
                
                return true
            }
            
        }
        
        
        // Check winner
        
   /*     // row 1
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
        
    */
        
        
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
