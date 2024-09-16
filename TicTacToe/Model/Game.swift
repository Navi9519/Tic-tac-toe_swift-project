//
//  Game.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-05.
//

import Foundation


class Game {

    
    
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
            
            // Tuple -> unpacking three elements for every possible winning condition
            
            let (a, b, c) = (line[0], line[1], line[2])
            
            // Checking if the first element in a winning line is NOT 0 and if it is same as rest of the line
            // -> If so the player/computer wins 
            if(gameBoard[a] != 0 && gameBoard[a] == gameBoard[b] && gameBoard[a] == gameBoard[c]) {
                
                return true
            }
            
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
