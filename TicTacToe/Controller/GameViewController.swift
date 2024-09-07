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
  
        
    
    /// Outlets ///
   
    @IBOutlet var Squares: [UIImageView]!
    @IBOutlet weak var gameBoardStack: UIStackView!
    
    
    // Symbols
    
    @IBOutlet weak var xSymbol: UIImageView!
    @IBOutlet weak var oSymbol: UIImageView!
    
    
    var initialTokenPosition: CGPoint = CGPoint.zero
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialTokenPosition = xSymbol.center
        initialTokenPosition = oSymbol.center

        
        
    }
    
    
    func resetGame() {
        game.resetBoard()
        for square in Squares {
            square.image = UIImage(systemName: "square")
            square.tintColor = UIColor.black
        }
    }
    


    
    // Can I do collection of these two?
    
    @IBAction func onXDrag(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: self.view)
         
        xSymbol.center = CGPoint(x: translation.x + xSymbol.center.x, y: translation.y + xSymbol.center.y )
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
      // arra.enumerated() returns a sequence of pairs, where each pair contains the index and the element
        for (index, square) in Squares.enumerated() {
            
           
        
        // Converts the view which the squares and the X symbol relates to, from the parent view of the components (in this case VStack) to the root view of the screen
            
            let squareFrame = square.superview?.convert(square.frame, to: view) ?? square.frame
            
            let xSymbol = xSymbol.superview?.convert(xSymbol.frame, to: view) ?? xSymbol.frame
        
            // Checks if squareFram contains symbol and if the move has not already been done
            if sender.state == .ended && squareFrame.contains(xSymbol) && square.image != UIImage(systemName: "xmark") &&  square.image != UIImage(systemName: "circle") {
        
                
            
                square.image = UIImage(systemName: "xmark")
                
                square.tintColor = UIColor.systemGreen
                
                // Logic to change value of selected square image from 0 to 1 or 2 based on player
                if game.checkWinner(index: index, player: PLAYER_ONE) {
                    
                    resetGame()
                    
                } 
                
                if(!game.gameBoard.contains(0)) {
                    resetGame()
                }
            
            }
            
        }
        
        if sender.state == .ended {
            print(game.gameBoard)
            xSymbol.center = initialTokenPosition
           
           
        }
        
        
        
        
    }
    
   
   
       
        
    @IBAction func onODrag(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
         
        oSymbol.center = CGPoint(x: translation.x + oSymbol.center.x, y: translation.y + oSymbol.center.y )
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        for (index, square) in Squares.enumerated() {
        
        // Converts the view which the squares and the X symbol relates to, from the parent view of the components (in this case VStack) to the root view of the screen
            
            let squareFrame = square.superview?.convert(square.frame, to: view) ?? square.frame
            
            let oSymbol = oSymbol.superview?.convert(oSymbol.frame, to: view) ?? oSymbol.frame
        
            // Checks if squareFram contains symbol and if the move has not already been done
            if sender.state == .ended && squareFrame.contains(oSymbol) && square.image != UIImage(systemName: "xmark") &&  square.image != UIImage(systemName: "circle") {
    
            
                square.image = UIImage(systemName: "circle")
                square.tintColor = UIColor.systemPink
                
                if game.checkWinner(index: index, player: PLAYER_TWO) {
                resetGame()

                } 
                if(!game.gameBoard.contains(0)) {
                    resetGame()
                }
                
                print(game.gameBoard)

            }
            
        }
        
        if sender.state == .ended {
            oSymbol.center = initialTokenPosition
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
