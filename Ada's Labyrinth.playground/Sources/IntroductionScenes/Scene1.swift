
import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport
import GameplayKit



public class Scene1: SKScene{
        
    
    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)

        let imagem = SKSpriteNode(imageNamed: "right.png")
        imagem.position = CGPoint(x: CGFloat(205), y: CGFloat(-410))
        let nextButton = Button(image: imagem){
                self.loadNext()
           
        }
        addChild(nextButton)
        
        let text = SKSpriteNode(imageNamed: "texts/text1.jpeg")
        text.size = CGSize(width: CGFloat(560), height: CGFloat(560))
        addChild(text)
        
        
        
    }
    
    func loadNext() {

        
        if let scene = Scene2(fileNamed: "IntroductionScenes/Scene2.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }

    }
    
}
