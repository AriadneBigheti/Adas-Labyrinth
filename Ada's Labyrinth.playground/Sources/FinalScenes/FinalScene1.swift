import Foundation
import SpriteKit

class FinalScene1: SKScene{

        
        public override func didMove(to view: SKView) {
            backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)
            
           
            let text = SKSpriteNode(imageNamed: "texts/text10.jpeg")
            text.size = CGSize(width: CGFloat(560), height: CGFloat(560))
            text.position = CGPoint(x: CGFloat(0), y: CGFloat(230))
            addChild(text)
            
            let notebook = SKSpriteNode(imageNamed: "objects/notebook2.png")
            notebook.size = CGSize(width: CGFloat(300), height: CGFloat(300))
            notebook.position = CGPoint(x: CGFloat(0), y: CGFloat(-100))
            addChild(notebook)
            
            
            
            let imagem = SKSpriteNode(imageNamed: "right.png")
            imagem.position = CGPoint(x: CGFloat(205), y: CGFloat(-410))
            let nextButton = Button(image: imagem){
                    self.loadNext()
               
            }
            addChild(nextButton)
            
        }
        
        
        func loadNext() {

            
            if let scene = FinalScene2(fileNamed: "FinalScenes/FinalScene2.sks") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit


                // Present the scene
                self.view?.presentScene(scene)
            }

        }

        

}


