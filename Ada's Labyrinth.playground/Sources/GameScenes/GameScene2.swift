import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport


public class GameScene2: SKScene{
    
    var Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
    
    }
    
    
    let labyrinth = [
                    [1,1,1,1,1,1,1],
                    [1,1,1,0,1,1,1],
                    [0,0,0,0,0,0,0],
                    [1,1,1,0,1,1,1],
                    [1,1,1,0,1,1,1],
                    [1,1,1,0,1,1,1],
                    [1,1,1,0,0,0,0],
                    [1,1,1,0,1,1,1],
                    [1,1,1,1,1,1,1],
                    ]
    var i_position = 2
    var j_position = 0


    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)
        
        self.Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
            self.dequeueActions(player: self.Ada)
        }
        Ada.x_position = -240
        Ada.y_position = 290
        Ada.position = CGPoint(x: CGFloat(-240), y: CGFloat(290))
        
        
        let lab = Labyrinth(matrix: labyrinth)
        addChild(lab)
        
        let nav = Navigation(player: Ada, i:1)
        addChild(nav)

        
        let exp1 = SKLabelNode(text: "4 > 2")
        let exp2 = SKLabelNode(text: "3 < 2")
        exp1.position = CGPoint(x: CGFloat(240), y: CGFloat(-40))
        exp2.position = CGPoint(x: CGFloat(240), y: CGFloat(280))
        exp1.fontName = "Avenixel-Regular"
        exp2.fontName = "Avenixel-Regular"
        exp1.fontColor = .darkGray
        exp2.fontColor = .darkGray
        addChild(exp1)
        addChild(exp2)
 
        addChild(Ada)
        Ada.StandBy()
        
      
    
    }
    
    
    func dequeueActions(player: Player){
        
        if player.actions == [] {
            player.StandBy()
        }
        
        else{
            player.isMoving = true
            
            let firstElement = player.actions.first
            player.actions.remove(at: 0)
            
            if firstElement == Command.Up{
                if (self.labyrinth[self.i_position-1][self.j_position] == 0){
                    self.i_position -= 1
                    player.MoveUp(yasis: 80)
                }else{
                    player.StandBy()
                }
                
            }
            
            else if firstElement == Command.Down{
                if (self.labyrinth[self.i_position+1][self.j_position] == 0){
                    self.i_position += 1
                    player.MoveDown(yasis: 80)
                }else{
                    player.StandBy()
                }
            }
            
            else if firstElement == Command.Right{
                if (self.i_position) == 2 && (self.j_position) == 6{
                    player.MoveRight(xasis: 80)
                    self.loadGameOver()
                    
                    return
                }else if(self.i_position) == 6 && (self.j_position) == 6{
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
                if (self.i_position) == 2 && (self.j_position) == 0{
                    player.StandBy()
                }else if (self.labyrinth[self.i_position][self.j_position-1] == 0){
                    self.j_position -= 1
                    player.MoveLeft(xasis: 80)
                }else{
                    player.StandBy()
                }
            }
        }
        
    }

    

  func loadNext() {

      
      if let scene = GameScene3(fileNamed: "GameScenes/GameScene3.sks") {
          // Set the scale mode to scale to fit the window
          scene.scaleMode = .aspectFit


          // Present the scene
          self.view?.presentScene(scene)
      }

  }

  func loadGameOver() {

      
      if let scene = GameOverScene2(fileNamed: "GameScenes/GameOverScene2.sks") {
          // Set the scale mode to scale to fit the window
          scene.scaleMode = .aspectFit


          // Present the scene
          self.view?.presentScene(scene)
      }

  }

  }


