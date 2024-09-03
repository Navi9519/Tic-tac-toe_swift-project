//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Ivan Dedic on 2024-09-01.
//

import UIKit

class GameViewController: UIViewController {
    
    
    var gameBoard: [String:[Int]] = [
        "A":  [1, 2, 3],
        "B":  [4, 5, 6],
        "C":  [7, 8, 9]
    ]
    
    
    /// Outlets ///
    // squares
    @IBOutlet weak var square1: UIImageView!
    @IBOutlet weak var square2: UIImageView!
    @IBOutlet weak var square3: UIImageView!
    @IBOutlet weak var square4: UIImageView!
    @IBOutlet weak var square5: UIImageView!
    @IBOutlet weak var square6: UIImageView!
    @IBOutlet weak var square7: UIImageView!
    @IBOutlet weak var square8: UIImageView!
    @IBOutlet weak var square9: UIImageView!
    
    // tokens
    
    @IBOutlet weak var xToken: UIImageView!
    @IBOutlet weak var oToken: UIImageView!
    
    
    var initialTokenPosition: CGPoint = CGPoint.zero
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initialTokenPosition = xToken.center
        initialTokenPosition = oToken.center
        
        for (keys,values) in gameBoard {
            
                   print("rad är \(keys). ruta är \(values) ")
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    @IBAction func onXDrag(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
         
        xToken.center = CGPoint(x: translation.x + xToken.center.x, y: translation.y + xToken.center.y )
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
        if sender.state == .ended {
            

            xToken.center = initialTokenPosition
        }
        
        
    }
    
   
        
       
        
    @IBAction func onODrag(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
         
        oToken.center = CGPoint(x: translation.x + oToken.center.x, y: translation.y + oToken.center.y )
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        if sender.state == .ended {
            

            oToken.center = initialTokenPosition
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
