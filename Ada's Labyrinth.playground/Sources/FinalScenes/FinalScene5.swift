import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport
import GameplayKit



public class FinalScene5: SKScene{
        
    
    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)

        
        let Ada = SKSpriteNode(imageNamed: "Ada/AdaProgramming.png")
        Ada.position = CGPoint(x: CGFloat(0), y: CGFloat(-20))
        addChild(Ada)
        
        let title = SKSpriteNode(imageNamed: "gameText/gameover.jpeg")
        title.position = CGPoint(x: CGFloat(0), y: CGFloat(220))
        title.size = CGSize(width: CGFloat(560), height: CGFloat(200))
        addChild(title)
        
        let imagem = SKSpriteNode(imageNamed: "buttons/playagain.jpeg")
        imagem.position = CGPoint(x: CGFloat(0), y: CGFloat(-180))
        imagem.size = CGSize(width: CGFloat(300), height: CGFloat(100))
        let nextButton = Button(image: imagem){
                self.loadNext()
           
        }
        addChild(nextButton)
        

    }
    
    func loadNext() {
        
        if let scene = GameScene1(fileNamed: "GameScenes/GameScene1.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }

    }
   
}
