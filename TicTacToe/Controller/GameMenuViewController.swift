//
//  GameMenuViewController.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-10.
//

import UIKit

class GameMenuViewController: UIViewController {
    
    
    var segueToGameViewController = "segueToGameViewController"
    
  /*  var names: [String] = ["Obama", "Arnold", "C.Norris", "D.Trump", "M.Jackon", "Messi", "Ronaldo", "King Kong", "Dracula", "Kobe"]
    
   */
    
    
    
    @IBOutlet weak var txtPlayerOne: UITextField!
    @IBOutlet weak var txtPlayerTwo: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        guard let destinatonVC = segue.destination as? GameViewController else {return}
        
        let playerOneName = txtPlayerOne.text?.isEmpty == false ? txtPlayerOne.text : "Player 1"
            let playerTwoName = txtPlayerTwo.text?.isEmpty == false ? txtPlayerTwo.text : "Player 2"
            
        let PLAYER_ONE = Player(name: playerOneName ?? "Player 1", id: 1)
        let PLAYER_TWO = Player(name: playerTwoName ?? "Player 2", id: 2)
        
            destinatonVC.PLAYER_ONE = PLAYER_ONE
            destinatonVC.PLAYER_TWO = PLAYER_TWO
            
        
        
    }
    
   
    @IBAction func btnPlay(_ sender: UIButton) {
       

            performSegue(withIdentifier: segueToGameViewController, sender: self)
        
           
        
    }
    


}
