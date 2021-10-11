import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport


public class GameScene3: SKScene{
    
    var Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
    
    }
  
    let labyrinth = [
                    [1,1,0,0,1,1,1],
                    [1,0,0,0,0,1,1],
                    [0,0,0,0,0,1,1],
                    [1,1,1,0,0,1,1],
                    [1,1,1,0,1,1,1],
                    [1,1,1,0,0,0,0],
                    [0,0,0,0,1,1,1],
                    [1,1,1,0,1,1,1],
                    [1,1,1,1,1,1,1],
                    ]
    var i_position = 6
    var j_position = 0
    


    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)
        
        
        self.Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
            self.dequeueActions(player: self.Ada)
        }
        
        Ada.x_position = -240
        Ada.y_position = -30
        Ada.position = CGPoint(x: CGFloat(-240), y: CGFloat(-30))
        
        let nav = Navigation(player: Ada, i:2)
        addChild(nav)
        
        let lab = Labyrinth(matrix: labyrinth)
        addChild(lab)
        
        
        let exp1 = SKLabelNode(text: "NOT(5 = 2)")
        let exp2 = SKLabelNode(text: "NOT(6 > 3)")
        let exp3 = SKLabelNode(text: "NOT(3 = 3)")

        exp1.position = CGPoint(x: CGFloat(-40), y: CGFloat(440))
        exp2.position = CGPoint(x: CGFloat(-210), y: CGFloat(280))
        exp3.position = CGPoint(x: CGFloat(210), y: CGFloat(40))
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
    func dequeueActions(player: Player){
        
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
                    self.loadNext()
                    return
                }
                else if (self.labyrinth[self.i_position-1][self.j_position] == 0){
                    player.MoveUp(yasis: 80)
                    self.i_position -= 1
                }else{
                    player.StandBy()
                }
                
            }
            
            else if firstElement == Command.Down{
                if (self.labyrinth[self.i_position+1][self.j_position] == 0){
                    self.i_position += 1
                    player.MoveDown(yasis: 80)
                    return
                }else{
                    player.StandBy()
                }
            }
            
            else if firstElement == Command.Right{
                if (self.i_position) == 5 && (self.j_position) == 6{
                    player.MoveRight(xasis: 80)
                    self.loadGameOver()
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
                if (self.i_position) == 6 && (self.j_position) == 0{
                    player.StandBy()
                    return
                }else if(self.i_position) == 2 && (self.j_position) == 0 {
                    player.MoveLeft(xasis:80)
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
    
    func buildLabyrinth(matriz:[[Int]]){
        let matrix = matriz
        var a = 0
        var b = 0
        
       
        
        
        b = -240
        for j in 0...6{
            a = 450
            for i in 0...8{
                let block = SKSpriteNode(imageNamed: "block.jpeg")
                block.size = CGSize(width: CGFloat(80), height: CGFloat(80))
                block.position = (CGPoint(x: CGFloat(b), y: CGFloat(a)))
                let floor = SKSpriteNode(imageNamed: "floor.jpeg")
                floor.position = (CGPoint(x: CGFloat(b), y: CGFloat(a)))
                floor.size = CGSize(width: CGFloat(80), height: CGFloat(80))
                
                if matrix[i][j] == 1{
                    self.addChild(block)
                }else if matrix[i][j] == 0{
                    self.addChild(floor)
                }
                
                a -= 80
            }
            b += 80
        }
        
        
        
        
    }

    func loadNext() {

        
       if let scene = GameScene4(fileNamed: "GameScenes/GameScene4.sks") {
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFit


        // Present the scene
        self.view?.presentScene(scene)
        }

    }

    func loadGameOver() {

        
        if let scene = GameOverScene3(fileNamed: "GameScenes/GameOverScene3.sks") {
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFit


        // Present the scene
        self.view?.presentScene(scene)
        }

    }

}


