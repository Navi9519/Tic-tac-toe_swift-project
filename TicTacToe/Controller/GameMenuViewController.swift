//
//  GameMenuViewController.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-10.
//

import UIKit

class GameMenuViewController: UIViewController {
    
    var player: Player?
    
    var segueToGameViewController = "segueToGameViewController"
    
    
    @IBOutlet weak var txtPlayerOne: UITextField!
    @IBOutlet weak var txtPlayerTwo: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
       
        
        guard let destinatonVC = segue.destination as? GameViewController else {return}
            
        var PLAYER_ONE = Player(name: txtPlayerOne.text ?? "Player 1", id: 1)
        var PLAYER_TWO = Player(name: txtPlayerTwo.text ?? "Player 2", id: 2)
        
        
            destinatonVC.PLAYER_ONE = PLAYER_ONE
            destinatonVC.PLAYER_TWO = PLAYER_TWO
            
       
        
        
    }
    
   
    @IBAction func btnPlay(_ sender: UIButton) {
        
        performSegue(withIdentifier: segueToGameViewController, sender: self)
        
        
    }
    


}
