import Foundation
import SpriteKit

class Labyrinth: SKNode{
    
    var labyrinth:[[Int]]
    
    init(matrix:[[Int]]){
        self.labyrinth = matrix
        super.init()
        self.buildLabyrinth(matriz: labyrinth)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildLabyrinth(matriz:[[Int]]){
        let matrix = matriz
        var a = 0
        var b = 0
        
        b = -240
        for j in 0...6{
            a = 450
            for i in 0...8{
                let block = SKSpriteNode(imageNamed: "labyrinth/block.png")
                block.size = CGSize(width: CGFloat(80), height: CGFloat(80))
                block.position = (CGPoint(x: CGFloat(b), y: CGFloat(a)))
                let floor = SKSpriteNode(imageNamed: "labyrinth/floor.jpeg")
                floor.position = (CGPoint(x: CGFloat(b), y: CGFloat(a)))
                floor.size = CGSize(width: CGFloat(80), height: CGFloat(80))
                
                if matrix[i][j] == 1{
                    self.addChild(block)
                }else if matrix[i][j] == 0{
                    self.addChild(floor)
                }
                
                a -= 80
            }
            b += 80
        }
    
    }
}
