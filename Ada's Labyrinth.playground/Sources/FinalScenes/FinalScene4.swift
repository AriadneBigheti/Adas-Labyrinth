import Foundation
import SpriteKit

class FinalScene4: SKScene{
   

        
        public override func didMove(to view: SKView) {
            backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)

           
            
            let text = SKSpriteNode(imageNamed: "texts/text13.jpeg")
            text.size = CGSize(width: CGFloat(560), height: CGFloat(560))
            text.position = CGPoint(x: CGFloat(0), y: CGFloat(250))
            addChild(text)
            
            
            let robot = Robot(program: "good")
            robot.position = CGPoint(x: CGFloat(100), y: CGFloat(-100))
            addChild(robot)
            
            let hello = SKSpriteNode(imageNamed: "hello.jpeg")
            hello.size = CGSize(width: CGFloat(170), height: CGFloat(100))
            hello.position = CGPoint(x: CGFloat(-90), y: CGFloat(15))
            addChild(hello)
            
            let Ada = SKSpriteNode(imageNamed: "Ada/Ada.png")
            Ada.size = CGSize(width: CGFloat(300), height: CGFloat(300))
            Ada.position = CGPoint(x: CGFloat(-130), y: CGFloat(-196))
            addChild(Ada)
            
            let imagem2 = SKSpriteNode(imageNamed: "left.png")
            imagem2.position = CGPoint(x: CGFloat(-205), y: CGFloat(-410))
            let backButton = Button(image: imagem2){
                    self.loadBack()
               
            }
            addChild(backButton)
            
            let imagem = SKSpriteNode(imageNamed: "right.png")
            imagem.position = CGPoint(x: CGFloat(205), y: CGFloat(-410))
            let nextButton = Button(image: imagem){
                    self.loadNext()
               
            }
            addChild(nextButton)
            
        }
        
        func loadNext() {
        
            if let scene = FinalScene5(fileNamed: "FinalScenes/FinalScene5.sks") {
            // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
 
                    
                // Present the scene
                self.view?.presentScene(scene)
            }

        }

        func loadBack() {

            
            if let scene = FinalScene3(fileNamed: "FinalScenes/FinalScene3.sks") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit


                // Present the scene
                self.view?.presentScene(scene)
            }

        }

}
