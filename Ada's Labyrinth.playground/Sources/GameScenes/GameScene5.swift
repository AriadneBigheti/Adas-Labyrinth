import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport


public class GameScene5: SKScene{
    
    var Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
    
    }
  

    let labyrinth = [
                    [1,1,1,1,1,1,1],
                    [1,0,0,0,0,0,1],
                    [1,0,0,0,0,0,1],
                    [1,0,1,1,1,0,1],
                    [1,0,1,0,0,0,0],
                    [1,0,1,1,1,0,1],
                    [1,0,0,0,0,0,1],
                    [1,0,0,0,0,0,1],
                    [1,1,1,1,1,1,1],
                    ]
    var i_position = 4
    var j_position = 6


    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)
        
        self.Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
            self.dequeueActions(player: self.Ada)
        }
        
        Ada.x_position = 240
        Ada.y_position = 130
        Ada.position = CGPoint(x: CGFloat(240), y: CGFloat(130))
        
        
        let nav = Navigation(player: Ada, i:4)
        addChild(nav)
        
        let lab = Labyrinth(matrix: labyrinth)
        addChild(lab)
        
        
        let computer = SKSpriteNode(imageNamed: "objects/notebook1.png")
        computer.position = (CGPoint(x: CGFloat(0), y: CGFloat(130)))
        addChild(computer)
        
        
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
                if (self.i_position) == 4 && (self.j_position) == 6{
                    player.StandBy()
                }else if (self.labyrinth[self.i_position][self.j_position+1] == 0){
                    self.j_position += 1
                    player.MoveRight(xasis: 80)
                }else{
                    player.StandBy()
                }
            }
            
            else if firstElement == Command.Left{ //firstElement == Command.Left
                if (self.i_position) == 4 && (self.j_position) == 4{
                    player.MoveLeft(xasis: 80)
                    self.loadNext()
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

        
        if let scene = FinalScene1(fileNamed: "FinalScenes/FinalScene1.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit


            // Present the scene
            self.view?.presentScene(scene)
        }

    }


}


