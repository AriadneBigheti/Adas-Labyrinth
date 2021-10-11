import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport

class Player: SKSpriteNode {
    
    public var actions: [Command] = []
    public var isMoving = false
    public var x_position = 0
    public var y_position = 0
    var dequeueActions: (() -> Void) = { }

    init(texture: SKTexture, function: @escaping () -> Void ) {
        self.dequeueActions = function
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateAda(frames:[SKTexture], moveAction: SKAction, doneAction: SKAction){
        
        let animaFrames:SKAction = SKAction.animate(with: frames, timePerFrame: 0.12)
    
        
        let moveactions = SKAction.sequence([moveAction, doneAction])
        let adaActions = SKAction.group([moveactions, SKAction.repeat(animaFrames, count: 12)])
            
        self.run(adaActions)
        
   
        
    }

    
    func StandBy(){
        self.isMoving = false
      
        var AdaWaitingFrames:[SKTexture] = []

        for i in 1...2{
            AdaWaitingFrames.append(SKTexture(imageNamed: "Ada/AdaWaiting/AdaWaiting-\(i)"))
        }

        let animaFrames:SKAction = SKAction.animate(with: AdaWaitingFrames, timePerFrame: 0.18)


        self.run(SKAction.repeatForever(animaFrames))
    }
    
    
    func MoveDown(yasis:Int){
      
        var AdaDownFrames:[SKTexture] = []
    
        for i in 1...4{
            AdaDownFrames.append(SKTexture(imageNamed: "Ada/AdaDown/AdaDown-\(i)"))
        }

        let moveAda = SKAction.moveTo(y: CGFloat(y_position - yasis), duration: TimeInterval(0.9))
            
        let done = SKAction.run({  [weak self] in
            self?.removeAllActions()
            self?.y_position -= yasis
            self?.isMoving = false
            self?.dequeueActions()
        })
        

        animateAda(frames: AdaDownFrames, moveAction: moveAda, doneAction: done)
    
    }
    
    
    func MoveLeft(xasis:Int){
        var AdaLeftFrames:[SKTexture] = []
    
        for i in 1...4{
            AdaLeftFrames.append(SKTexture(imageNamed: "Ada/AdaLeft/AdaLeft-\(i)"))
        }
    
    
        let moveAda = SKAction.moveTo(x: CGFloat(x_position - xasis), duration: TimeInterval(1))
            
        let done = SKAction.run({  [weak self] in
            self?.removeAllActions()
            self?.x_position -= xasis
            self?.isMoving = false
            self?.dequeueActions()
        })
        

        animateAda(frames: AdaLeftFrames, moveAction: moveAda, doneAction: done)
    
    }
    
    func MoveRight(xasis:Int){

        var AdaRightFrames:[SKTexture] = []
    
        for i in 1...4{
            AdaRightFrames.append(SKTexture(imageNamed: "Ada/AdaRight/AdaRight-\(i)"))
        }
        
    
        let moveAda = SKAction.moveTo(x: CGFloat(x_position + xasis), duration: TimeInterval(1))
        
        let done = SKAction.run({  [weak self] in
            self?.removeAllActions()
            self?.x_position += xasis
            self?.isMoving = false
            self?.dequeueActions()
        })
        

        animateAda(frames: AdaRightFrames, moveAction: moveAda, doneAction: done)
        
    }
    
    func MoveUp(yasis:Int){
       
        var AdaUpFrames:[SKTexture] = []
    
        for i in 1...4{
            AdaUpFrames.append(SKTexture(imageNamed: "Ada/AdaUp/AdaUp-\(i)"))
        }
            
    
        let moveAda = SKAction.moveTo(y: CGFloat(y_position + yasis), duration: TimeInterval(0.9))
        
        let done = SKAction.run({  [weak self] in
            self?.removeAllActions()
            self?.isMoving = false
            self?.y_position += yasis
            self?.dequeueActions()
        })
       

        animateAda(frames: AdaUpFrames, moveAction: moveAda, doneAction: done)
    
    }
 
    
}
