
import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport
import GameplayKit



public class Scene3: SKScene{
        
    
    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)

        let imagem = SKSpriteNode(imageNamed: "right.png")
        imagem.position = CGPoint(x: CGFloat(205), y: CGFloat(-410))
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
        
        let text = SKSpriteNode(imageNamed: "texts/text3.jpeg")
        text.size = CGSize(width: CGFloat(560), height: CGFloat(560))
        text.position = CGPoint(x: CGFloat(0), y: CGFloat(250))
        addChild(text)
        
        let robot = Robot(program: "evil")
        addChild(robot)
        
        
    }
    
    func loadNext() {
        
        if let scene = Scene4(fileNamed: "IntroductionScenes/Scene4.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }

    }
    func loadBack() {
        
        if let scene = Scene2(fileNamed: "IntroductionScenes/Scene2.sks") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
 

            // Present the scene
            self.view?.presentScene(scene)
        }
        
    }
}


