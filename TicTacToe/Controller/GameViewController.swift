//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-01.
//

import UIKit

class GameViewController: UIViewController {
    
    
    
    // objects
    
    var game = Game()
    var PLAYER_ONE: Player?
    var PLAYER_TWO: Player?
    
    // variables
    
    var playerOneIsPlaying: Bool = true
    var computerIsPlaying: Bool?
    var initialSymbolPosition: CGPoint = CGPoint.zero
    let segueToGameMenuViewController = "segueToGameMenuViewController"
    

    
    
    /// Outlets ///
    
    @IBOutlet var Squares: [UIImageView]!
    @IBOutlet weak var gameBoardStack: UIStackView!
    
    @IBOutlet weak var lblPlayerOne: UILabel!
    @IBOutlet weak var lblPlayerTwo: UILabel!
    
    @IBOutlet weak var lblPlayerOneScore: UILabel!
    @IBOutlet weak var lblPlayerTwoScore: UILabel!
    
    // Symbol outles
    @IBOutlet weak var xSymbol: UIImageView!
    @IBOutlet weak var oSymbol: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let playerOne = PLAYER_ONE, let playerTwo = PLAYER_TWO else {return}
        
        lblPlayerOne.text = "\(playerOne.name)s turn"
        lblPlayerTwo.text = playerTwo.name
        
        initialSymbolPosition = xSymbol.center
        initialSymbolPosition = oSymbol.center
        
        
        
    }
    
    
    func resetGame() {
        
        
        game.resetBoard()
        
        for square in Squares {
            square.image = UIImage(systemName: "square")
            square.tintColor = UIColor.black
        }
        
        
    }
    
    
    func updateTotalScore(player: Player) {
        guard let playerOne = PLAYER_ONE, let playerTwo = PLAYER_TWO else {return}
        player.updateScore()
        lblPlayerOneScore.text = "Score \(String(playerOne.totalScore))"
        lblPlayerTwoScore.text = "Score \(String(playerTwo.totalScore))"
        
    }
    
    
    
    func winnerAlert(title: String) {
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        
        let keepPlayingAction = UIAlertAction(title: "Keep Playing", style: .default, handler: nil)
        alertController.addAction(keepPlayingAction)
        
        let backToMenuAction  = UIAlertAction(title: "Back to Menu", style: .default) { [self] _ in
            performSegue(withIdentifier: segueToGameMenuViewController, sender: self)
            
            
        }
        alertController.addAction(backToMenuAction)
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func computerMove(computerID: Int, playerId: Int) {
        
        guard let computerIsPlaying = computerIsPlaying else {return}
        
        if (computerIsPlaying) {
            
            oSymbol.isUserInteractionEnabled = false
            
            // Creating empty array that will be filled with the remaining 0s from gameBoard array efter player ones turn.
            var remainingZerosIndices: [Int] = []
            
            for (index, value) in game.gameBoard.enumerated() {
                if value == 0 {
                    // adds the elements which are not 1 or 2 to the empty array
                    remainingZerosIndices.append(index)
                }
            }
            
            // sets variable randomIndex to a random element of the remaining 0 indexes in the array
            if let randomIndex = remainingZerosIndices.randomElement() {
                
                // sets the random index which has 0 value in gameboard to computers value 2
                game.gameBoard[randomIndex] = computerID
                
                // Update the UI based on the random computer choice
                for (index, square) in Squares.enumerated() {
                    
                    if index == randomIndex {
                        
                        square.image = UIImage(systemName: "circle")
                        square.tintColor = UIColor.systemPink
                        
                        guard let computer = PLAYER_TWO else {return}
                        
                        // checks if computer wins the game 
                        if game.checkWinner(index: index, player: computer) {
                            
                            winnerAlert(title: "\(computer.name) won the round")
                            
                            updateTotalScore(player: computer)
                            
                            resetGame()
                            
                            
                        }
                        
                    }
                    
                }
                
            }
            
            playerOneIsPlaying.toggle()
            
            
            guard let playerOne = PLAYER_ONE, let playerTwo = PLAYER_TWO else {return}
            
            
            // sets the UI labels on whos playing based on x or o drag
                lblPlayerOne.text = playerOne.name
                lblPlayerTwo.text = "\(playerTwo.name)s turn"
            
                lblPlayerTwo.text = playerTwo.name
                lblPlayerOne.text = "\(playerOne.name)s turn"
    
            
        } else {
            return
        }
        
    }
    
    
    
    
    @IBAction func onXDrag(_ sender: UIPanGestureRecognizer) {
        
        
        if(playerOneIsPlaying) {
            
            guard let playerOne = PLAYER_ONE else {return}
            
            handleDrag(for: xSymbol, sender: sender, player: playerOne, playerId: playerOne.id, playerOneLbl: lblPlayerOne, playerTwoLbl: lblPlayerTwo, imageName: "xmark", tintcolor: UIColor.systemGreen)
            

            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    @IBAction func onODrag(_ sender: UIPanGestureRecognizer) {
        
        if (!playerOneIsPlaying) {
            
            guard let playerTwo = PLAYER_TWO else {return}
            
            handleDrag(for: oSymbol, sender: sender, player: playerTwo, playerId: playerTwo.id, playerOneLbl: lblPlayerOne, playerTwoLbl: lblPlayerTwo, imageName: "circle", tintcolor: UIColor.systemPink)
            
            
        }
        
        
    }
    
    
    
    func handleDrag(for symbol: UIImageView, sender: UIPanGestureRecognizer, player: Player, playerId: Int, playerOneLbl: UILabel, playerTwoLbl: UILabel, imageName: String, tintcolor: UIColor) {
        
        // translation(in:) -> return the amount of movement in the x and y axis
        let translation = sender.translation(in: self.view)
        
        // adjusts the position of the UI image view on th x and y axis based on finger move.
        symbol.center = CGPoint(x: translation.x + symbol.center.x, y: translation.y + symbol.center.y )
        
        // resets the translation to 0, 0 after updating the position
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        for (index, square) in Squares.enumerated() {
            
            // Converts the view which the squares and the symbol relates to, from the parent view of the components (in this case VStack) to the root view of the screen
            let squareFrame = square.superview?.convert(square.frame, to: view) ?? square.frame
            let symbolFrame = symbol.superview?.convert(symbol.frame, to: view) ?? symbol.frame
            
            // Checks if squareFram contains symbol and if the move has not already been done
            if sender.state == .ended && squareFrame.contains(symbolFrame) && square.image != UIImage(systemName: "xmark") &&  square.image != UIImage(systemName: "circle") {
                
                
                square.image = UIImage(systemName: imageName)
                square.tintColor = tintcolor
                playerOneIsPlaying.toggle()
                
                
                
                guard let playerOne = PLAYER_ONE, let playerTwo = PLAYER_TWO else {return}
                
                
                // sets the UI labels on whos playing based on x or o drag
                if playerId == playerOne.id{
                    playerOneLbl.text = playerOne.name
                    playerTwoLbl.text = "\(playerTwo.name)s turn"
                    
                } else {
                    playerTwoLbl.text = playerTwo.name
                    playerOneLbl.text = "\(playerOne.name)s turn"
                }
                
                // Checks the winner and connects the choosen square index with the gameboard index. 
                if game.checkWinner(index: index, player: player) {
                    
                    winnerAlert(title: "\(player.name) won the round")
                    
                    updateTotalScore(player: player)
                    
                    resetGame()
                    
                    
                }
                if(!game.gameBoard.contains(0)) {
                    resetGame()
                }
                
                print(game.gameBoard)
                
                // Asyncronus code working as a timer, everything inside this funcion will run 1.5 second from .now, invalidates itself.
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    
                    self.computerMove(computerID: playerTwo.id, playerId: playerId)
                    print(self.game.gameBoard)
                    
                }
                
               
            }
            
        }
        
        if sender.state == .ended {
            symbol.center = initialSymbolPosition
        }
        
        
        
    }
    
    
    
    
}
