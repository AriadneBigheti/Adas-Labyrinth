import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport


public class GameScene1: SKScene{
        
    
        var Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
        
        }
    
        let labyrinth = [
                        [1,1,1,0,1,1,1],
                        [1,1,1,0,0,0,1],
                        [1,1,1,0,1,1,1],
                        [0,0,0,0,0,0,0],
                        [1,1,1,0,1,1,1],
                        [1,1,0,0,0,1,1],
                        [1,1,0,0,0,1,1],
                        [1,1,0,0,0,1,1],
                        [1,1,1,0,1,1,1],
                        ]
        var i_position = 7
        var j_position = 3
    
    
    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)
        
        self.Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
            self.dequeueActions(player: self.Ada)
        }
        Ada.x_position = 0
        Ada.y_position = -110
        Ada.position = CGPoint(x: CGFloat(0), y: CGFloat(-110))

        
        let lab = Labyrinth(matrix: labyrinth)
        addChild(lab)
        
        let nav = Navigation(player: Ada, i:1)
        addChild(nav)
        
        let exp1 = SKLabelNode(text: "3 = 3")
        let exp2 = SKLabelNode(text: "2 = 1")
        let exp3 = SKLabelNode(text: "4 = 2")
        exp1.position = CGPoint(x: CGFloat(240), y: CGFloat(200))
        exp2.position = CGPoint(x: CGFloat(-240), y: CGFloat(200))
        exp3.position = CGPoint(x: CGFloat(0), y: CGFloat(440))
        exp1.fontName = "Avenixel-Regular"
        exp2.fontName = "Avenixel-Regular"
        exp3.fontName = "Avenixel-Regular"
        exp1.fontColor = .darkGray
        exp2.fontColor = .darkGray
        exp3.fontColor = .darkGray

        addChild(exp1)
        addChild(exp2)
        addChild(exp3)
        
        
        addChild(Ada)
        Ada.StandBy()
        
   
    }
        
    func dequeueActions(player:Player){
        
        if player.actions == [] {
            player.StandBy()
        }
        
        else{
            player.isMoving = true
            
            let firstElement = player.actions.first
            player.actions.remove(at: 0)
            
            if firstElement == Command.Up{
                if (self.i_position) == 0 && (self.j_position) == 3{
                    player.MoveUp(yasis: 80)
                    self.loadGameOver()
                    return
                }
                else if (self.labyrinth[self.i_position-1][self.j_position] == 0){
                    self.i_position -= 1
                    player.MoveUp(yasis: 80)
                }else{
                    player.StandBy()
                }
                
            }
            
            else if firstElement == Command.Down{
                if (self.i_position == 8){
                    player.StandBy()
                    return
                }
                if (self.labyrinth[self.i_position+1][self.j_position] == 0){
                    self.i_position += 1
                    player.MoveDown(yasis: 80)
                }else{
                    player.StandBy()
                }
            }
            
            else if firstElement == Command.Right{
                if (self.i_position) == 3 && (self.j_position) == 6{
                    player.MoveRight(xasis: 80)
                    self.loadNext()
                    return
                }
                else if (self.labyrinth[self.i_position][self.j_position+1] == 0){
                    self.j_position += 1
                    player.MoveRight(xasis: 80)
                }else{
                    player.StandBy()
                }
            }
            
            else{ //firstElement == Command.Left
                if (self.i_position) == 3 && (self.j_position) == 0{
                    player.MoveLeft(xasis: 80)
                    self.loadGameOver()
                    return
                }
                else if (self.labyrinth[self.i_position][self.j_position-1] == 0){
                    self.j_position -= 1
                    player.MoveLeft(xasis: 80)
                }else{
                    player.StandBy()
                }
            }
        }
        
    }

    
    
    func loadNext() {

        
        if let scene = GameScene2(fileNamed: "GameScenes/GameScene2.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }

    }
    
    func loadGameOver() {

        
        if let scene = GameOverScene1(fileNamed: "GameScenes/GameOverScene1.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }

    }
    
}

