
import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport
import GameplayKit



public class Scene8: SKScene{
        
    
    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)

        
        let Ada = SKSpriteNode(imageNamed: "Ada/Ada.png")
        Ada.position = CGPoint(x: CGFloat(0), y: CGFloat(0))
        addChild(Ada)
        
        let title = SKSpriteNode(imageNamed: "gameText/gametitle.jpeg")
        title.position = CGPoint(x: CGFloat(0), y: CGFloat(230))
        title.size = CGSize(width: CGFloat(500), height: CGFloat(200))
        addChild(title)
        
        
        let imagem = SKSpriteNode(imageNamed: "buttons/start.jpeg")
        imagem.position = CGPoint(x: CGFloat(0), y: CGFloat(-270))
        imagem.size = CGSize(width: CGFloat(200), height: CGFloat(200))
        let nextButton = Button(image: imagem){
                self.loadNext()
           
        }
        addChild(nextButton)
        
        let imagem2 = SKSpriteNode(imageNamed: "left.png")
        imagem2.position = CGPoint(x: CGFloat(-205), y: CGFloat(-410))
        let backButton = Button(image: imagem2){
                self.loadBack()
           
        }
        addChild(backButton)

    }
    
    func loadNext() {
        
        if let scene = GameScene1(fileNamed: "GameScenes/GameScene1.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }

    }
    func loadBack() {
        
        if let scene = Scene7(fileNamed: "IntroductionScenes/Scene7.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }
        
    }
}


