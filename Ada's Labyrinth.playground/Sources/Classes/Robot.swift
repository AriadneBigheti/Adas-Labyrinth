import Foundation
import SpriteKit

class Robot : SKSpriteNode{
    
    var robotFrames: [SKTexture] = []
    
    init(program: String){
        if program == "evil"{
            for i in 1...4{
                robotFrames.append(SKTexture(imageNamed: "robot/evil robot-\(i)"))
            }

        
        }else{

            for i in 1...4{
                robotFrames.append(SKTexture(imageNamed: "robot/good robot-\(i)"))
            }
 
        }
        super.init(texture: robotFrames[1], color: UIColor.clear, size: robotFrames[1].size())
        self.position = CGPoint(x: CGFloat(0), y: CGFloat(-100))
        //self.size = CGSize(width: CGFloat(), height: CGFloat())
        self.animateRobot(frames: robotFrames)
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateRobot(frames : [SKTexture]){
        
        let animaFrames:SKAction = SKAction.animate(with: frames, timePerFrame: 0.12)
        
        let animatedRobot = SKAction.repeatForever(animaFrames)

        self.run(animatedRobot)
 
    }
    
}
