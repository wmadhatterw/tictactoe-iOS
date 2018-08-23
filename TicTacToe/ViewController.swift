//
//  ViewController.swift
//  TicTacToe
//
//  Created by Seth Walton on 8/22/18.
//  Copyright © 2018 Seth Walton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var resetBtn: UIButton!
    
    
    @IBAction func reset(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        
        
        for i in 1..<10{
            var button: UIButton
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        label.alpha = 0
        resetBtn.alpha = 0
    }
    
    var activeGame = true
    
    var activePlayer = 1 // 1 is nought 2 is crosses
    
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 empty, 1 -nought, 2 crosses
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,4,8],[2,4,6],[0,3,6], [2,5,8], [1,4,7], [2,5,8] ]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1{
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
        }
        
        for combination in winningCombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                activeGame = false
                
                label.isHidden = false
                resetBtn.isHidden = false
                //winner winner chicken dinner
                if gameState[combination[0]] == 1 {
                    label.text = "noughts has Won"
                    
                }else {
                    label.text = "crosses has Won"
                }
                UIView.animate(withDuration: 1, animations: {
                   
                    self.resetBtn.alpha = 1
                    self.label.alpha = 1
                })
                
            }
        }
        
        
    }
    
/*UIView.animate(withDuration: 1) {
 self.image.alpha = 1
 }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.alpha = 0
        resetBtn.alpha = 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

