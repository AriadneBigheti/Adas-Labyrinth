import Foundation
import SpriteKit

class GameOverScene2: SKScene{



    public override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.95, alpha: 1.00)
     
        
           let imagem = SKSpriteNode(imageNamed: "buttons/tryagain.jpeg")
           imagem.position = CGPoint(x: CGFloat(0), y: CGFloat(-140))
           imagem.size = CGSize(width: CGFloat(300), height: CGFloat(100))
           let nextButton = Button(image: imagem){
                   self.loadNext()
              
           }
           addChild(nextButton)
           
        let message = SKSpriteNode(imageNamed: "gameText/message.jpeg")
        message.position = CGPoint(x: CGFloat(70), y: CGFloat(140))
        message.size = CGSize(width: CGFloat(250), height: CGFloat(170))
        addChild(message)
        
        
        let Ada =  Player(texture: SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-1")){
            
        }
        Ada.position = CGPoint(x: CGFloat(-100), y: CGFloat(30))
        Ada.size = CGSize(width: CGFloat(150), height: CGFloat(150))
        addChild(Ada)
        Ada.StandBy()
        
    }
        func loadNext() {

        
            if let scene = GameScene2(fileNamed: "GameScenes/GameScene2.sks") {
            // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit


            // Present the scene
                self.view?.presentScene(scene)
            }

    }

    
}
