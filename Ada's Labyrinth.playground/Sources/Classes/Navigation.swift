import Foundation
import SpriteKit

class Navigation: SKNode{
    
    var Ada:Player
    let image1 = SKSpriteNode(imageNamed: "buttons/game/up.png")
    let image2 = SKSpriteNode(imageNamed: "buttons/game/down.png")
    let image3 = SKSpriteNode(imageNamed: "buttons/game/right.png")
    let image4 = SKSpriteNode(imageNamed: "buttons/game/left.png")
    let text = SKSpriteNode(imageNamed: "gameText/advise-1.jpeg")

    
    init(player: Player, i:Int){
        self.Ada = player
        
        image1.size = CGSize(width: CGFloat(50), height: CGFloat(50))
        image2.size = CGSize(width: CGFloat(50), height: CGFloat(50))
        image3.size = CGSize(width: CGFloat(50), height: CGFloat(50))
        image4.size = CGSize(width: CGFloat(50), height: CGFloat(50))
        image1.position  = CGPoint(x: 180, y: -310)
        image2.position  = CGPoint(x: 180, y: -390)
        image3.position  = CGPoint(x: 225, y: -350)
        image4.position  = CGPoint(x: 135, y: -350)
        
        if i==2{
            text.texture = SKTexture(imageNamed: "gameText/advise-2.jpeg")
        }else if i==3{
            text.texture = SKTexture(imageNamed: "gameText/advise-3.jpeg")
        }else if i==4{
            text.texture = SKTexture(imageNamed: "gameText/advise-4.jpeg")

        }
        
        text.size = CGSize(width: CGFloat(350), height: CGFloat(250))
        text.position  = CGPoint(x: -90, y: -355)
       
        
        super.init()
        
        let buttonUp = Button(image: image1){
            self.Ada.actions.append(Command.Up)
            self.newAction()
        }
        self.addChild(buttonUp)
            
        let buttonDown = Button(image: image2){
            self.Ada.actions.append(Command.Down)
            self.newAction()
        }
        self.addChild(buttonDown)
        
        
        let buttonRight = Button(image: image3){
            self.Ada.actions.append(Command.Right)
            self.newAction()
        }
        self.addChild(buttonRight)
        
        
        
        let buttonLeft = Button(image: image4){
            self.Ada.actions.append(Command.Left)
            self.newAction()
        }
        self.addChild(buttonLeft)
        
        self.addChild(text)

    
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func newAction(){
        if !(self.Ada.isMoving){
            self.Ada.dequeueActions()
        }
    }
    
}
