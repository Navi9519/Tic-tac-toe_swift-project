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
    var PLAYER_ONE = Player(name: "Ivan", id: 1)
    var PLAYER_TWO = Player(name: "Onur", id: 2)
    
    // variables
    
    var playerOneIsPlaying: Bool = true
    
    
    
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
    
    
    var initialSymbolPosition: CGPoint = CGPoint.zero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPlayerOne.text = "Player 1s turn"
        lblPlayerTwo.text = "Player 2"
        
        initialSymbolPosition = xSymbol.center
        initialSymbolPosition = oSymbol.center
        
        
        
    }
    
    
    func resetGame() {
        
        
        game.resetBoard()
        
        for square in Squares {
            square.image = UIImage(systemName: "square")
            square.tintColor = UIColor.black
        }
        
        playerOneIsPlaying = true
        lblPlayerOne.text = "Player 1s turn"
        lblPlayerTwo.text = "Player 2"
    }
    
    
    func updateTotalScore(player: Player) {
        
        player.updateScore()
        lblPlayerOneScore.text = "Score \(String(PLAYER_ONE.totalScore))"
        lblPlayerTwoScore.text = "Score \(String(PLAYER_TWO.totalScore))"
        
    }
    
    
    
    
    
    
    @IBAction func onXDrag(_ sender: UIPanGestureRecognizer) {
        
        
        if(playerOneIsPlaying) {
            
            handleDrag(for: xSymbol, sender: sender, player: PLAYER_ONE, playerId: PLAYER_ONE.id, playerOneLbl: lblPlayerOne, playerTwoLbl: lblPlayerTwo, imageName: "xmark", tintcolor: UIColor.systemGreen)
        }
        
        
        
    }
    
    
    
    
    
    @IBAction func onODrag(_ sender: UIPanGestureRecognizer) {
        
        if (!playerOneIsPlaying) {
            
            handleDrag(for: oSymbol, sender: sender, player: PLAYER_TWO, playerId: PLAYER_TWO.id, playerOneLbl: lblPlayerOne, playerTwoLbl: lblPlayerTwo, imageName: "circle", tintcolor: UIColor.systemPink)
            
            
        }
        
        
    }
    
    
    
    func handleDrag(for symbol: UIImageView, sender: UIPanGestureRecognizer, player: Player, playerId: Int, playerOneLbl: UILabel, playerTwoLbl: UILabel, imageName: String, tintcolor: UIColor) {
        
        
        let translation = sender.translation(in: self.view)
        
        symbol.center = CGPoint(x: translation.x + symbol.center.x, y: translation.y + symbol.center.y )
        
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
                
                if playerId == PLAYER_ONE.id{
                    playerOneLbl.text = "Player 1"
                    playerTwoLbl.text = "Player 2s turn"
                    
                } else {
                    playerTwoLbl.text = "Player 2"
                    playerOneLbl.text = "Player 1s turn"
                }
                
                if game.checkWinner(index: index, player: player) {
                   
                    updateTotalScore(player: player)
                     
                    resetGame()
                    
                    
                }
                if(!game.gameBoard.contains(0)) {
                    resetGame()
                }
                
                print(game.gameBoard)
                
            }
            
        }
        
        if sender.state == .ended {
            symbol.center = initialSymbolPosition
        }
        
        
        
        
        
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
