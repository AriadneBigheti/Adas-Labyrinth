import Foundation
import SpriteKit

class Button: SKNode {
    
    var image: SKSpriteNode?
    var action: (() -> Void)?
    
    
    init(image: SKSpriteNode, action: @escaping () -> Void){
        self.image = image
        self.action = action
        super.init()
        self.isUserInteractionEnabled = true
        self.addChild(image)
        
    }
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?()
        
    }

    
}

