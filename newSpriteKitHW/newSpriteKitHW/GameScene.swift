//
//  GameScene.swift
//  newSpriteKitHW
//
//  Created by Анастасия Восколович on 28.12.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let round = SKShapeNode(circleOfRadius: 45)
    
    override func didMove(to view: SKView) {
        backgroundColor = randomColor()
        
        round.fillColor = .black
        round.position.x = frame.midX
        round.position.y = frame.midY
        round.physicsBody = .init(rectangleOf: round.frame.size)
        round.physicsBody?.isDynamic = false
        self.addChild(round)
        view.addSubview(slider)
    
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0.1...1),
                       green: .random(in: 0.1...1),
                       blue: .random(in: 0.1...1),
                       alpha: 1.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let position = touches.first!.location(in: self)
        if let node = self.nodes(at: position).first {
            node.physicsBody = nil
        }
        
    }
    
    let slider = UISlider(frame: CGRect(x: 250, y: 250, width: 280, height: 20))
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    private var label : SKLabelNode?
    //    private var spinnyNode : SKShapeNode?
    //
    //    override func didMove(to view: SKView) {
    //
    //        // Get label node from scene and store it for use later
    //        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
    //        if let label = self.label {
    //            label.alpha = 0.0
    //            label.run(SKAction.fadeIn(withDuration: 2.0))
    //        }
    //
    //        // Create shape node to use during mouse interaction
    //        let w = (self.size.width + self.size.height) * 0.05
    //        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
    //
    //        if let spinnyNode = self.spinnyNode {
    //            spinnyNode.lineWidth = 2.5
    //
    //            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
    //            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
    //                                              SKAction.fadeOut(withDuration: 0.5),
    //                                              SKAction.removeFromParent()]))
    //        }
    //    }
    //
    //
    //    func touchDown(atPoint pos : CGPoint) {
    //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
    //            n.position = pos
    //            n.strokeColor = SKColor.green
    //            self.addChild(n)
    //        }
    //    }
    //
    //    func touchMoved(toPoint pos : CGPoint) {
    //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
    //            n.position = pos
    //            n.strokeColor = SKColor.blue
    //            self.addChild(n)
    //        }
    //    }
    //
    //    func touchUp(atPoint pos : CGPoint) {
    //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
    //            n.position = pos
    //            n.strokeColor = SKColor.red
    //            self.addChild(n)
    //        }
    //    }
    //
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        if let label = self.label {
    //            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
    //        }
    //
    //        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    //    }
    //
    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    //    }
    //
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    //    }
    //
    //    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    //    }
    //
    //
    
}
