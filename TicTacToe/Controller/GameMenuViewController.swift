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
    var compuerIsPlaying = true
    
    var names: [String] = ["Obama", "Arnold", "C.Norris", "D.Trump", "M.Jackon", "Messi", "Ronaldo", "King Kong", "Dracula", "Kobe"]
    
    let segueToGameViewController = "segueToGameViewController"
    
    @IBOutlet weak var txtPlayerOne: UITextField!
    @IBOutlet weak var txtPlayerTwo: UITextField!
    @IBOutlet weak var switchPlayAgainstComp: UISwitch!
    @IBOutlet weak var lblPlayerTwoOrComp: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        guard let destinatonVC = segue.destination as? GameViewController else {return}
        

        destinatonVC.PLAYER_ONE = PLAYER_ONE
        destinatonVC.PLAYER_TWO = PLAYER_TWO
        
        if switchPlayAgainstComp.isOn {
            destinatonVC.computerIsPlaying = compuerIsPlaying
        }
        
    }
    
    
    @IBAction func onSwitch(_ sender: Any) {
        
        if switchPlayAgainstComp.isOn {
            
            txtPlayerTwo.isUserInteractionEnabled = false
            
            txtPlayerTwo.placeholder = ""
            lblPlayerTwoOrComp.text = "Computer"
            
        } else {
            
            txtPlayerTwo.isUserInteractionEnabled = true
            txtPlayerTwo.placeholder = "Name:"
            lblPlayerTwoOrComp.text = "Player 2"
        }
        
    }
    
    
    @IBAction func btnPlay(_ sender: UIButton) {
        
        
        
        guard let playerOneName = txtPlayerOne.text, !playerOneName.isEmpty else {
            
            nameInputAlert(message: "Please enter Player One's name")
            return
        }
        
        
        if switchPlayAgainstComp.isOn {
            
            PLAYER_ONE = Player(name: playerOneName, id: 1)
            // Generate a random name for the computer if you choose to play against computer
            let computerName = txtPlayerTwo.text!.isEmpty ? names.randomElement()! : txtPlayerTwo.text!
            PLAYER_TWO = Player(name: computerName, id: 2)
        } else {
            
            guard let playerTwoName = txtPlayerTwo.text, !playerTwoName.isEmpty else {
               
                nameInputAlert(message: "Please enter Player Two's name")
                return
            }
            
            
            PLAYER_ONE = Player(name: playerOneName, id: 1)
            PLAYER_TWO = Player(name: playerTwoName, id: 2)
        }
        
        
        performSegue(withIdentifier: segueToGameViewController, sender: self)
    }
    
    
    func nameInputAlert(message: String) {
        let alert = UIAlertController(title: "Input Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
