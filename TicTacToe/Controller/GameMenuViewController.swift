//
//  GameMenuViewController.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-10.
//

import UIKit

class GameMenuViewController: UIViewController {
    
    var PLAYER_ONE: Player?
    var PLAYER_TWO: Player?
    
    
    var names: [String] = ["Obama", "Arnold", "C.Norris", "D.Trump", "M.Jackon", "Messi", "Ronaldo", "King Kong", "Dracula", "Kobe"]
    
    var segueToGameViewController = "segueToGameViewController"
    
    
    @IBOutlet weak var txtPlayerOne: UITextField!
    @IBOutlet weak var txtPlayerTwo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        guard let destinatonVC = segue.destination as? GameViewController else {return}
        
        
        destinatonVC.PLAYER_ONE = PLAYER_ONE
        destinatonVC.PLAYER_TWO = PLAYER_TWO
        
        
    }
    
    
    @IBAction func btnPlay(_ sender: UIButton) {
        
        
        // Change this?
        let playerOneName = txtPlayerOne.text!.isEmpty ? (names.randomElement()!) : txtPlayerOne.text!
        let playerTwoName = txtPlayerTwo.text!.isEmpty ? (names.randomElement()!) : txtPlayerTwo.text!
        
       // if let playerOneName = txtPlayerOne.text, let playerTwoName
        
        PLAYER_ONE = Player(name: playerOneName, id: 1)
        PLAYER_TWO = Player(name: playerTwoName, id: 2)
        
        performSegue(withIdentifier: segueToGameViewController, sender: self)
        
        
    }
    
    
    
}
