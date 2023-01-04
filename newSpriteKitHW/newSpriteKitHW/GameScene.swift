//
//  GameScene.swift
//  newSpriteKitHW
//
//  Created by Анастасия Восколович on 28.12.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let round = SKShapeNode(circleOfRadius: 30)
    var slider = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
    
    
    override func didMove(to view: SKView) {
        
        round.fillColor = .black
        round.position.x = frame.midX
        round.position.y = frame.midY
        round.physicsBody = .init(rectangleOf: round.frame.size)
        round.physicsBody?.isDynamic = false
        round.speed = num
        self.addChild(round)
        
        slider.tintColor = UIColor.black
        slider.maximumTrackTintColor = UIColor.white
        
        view.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            slider.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        loadSlider()
        self.changeColor()
    }
    
    func changeColor() {
        let runAction = SKAction.run { self.randomColor() }
        self.run(.repeatForever(runAction), withKey: "changeBgKey")
    }
    func randomColor() {
        self.backgroundColor = .init(
            red: .random(in: 0.1...1),
            green: .random(in: 0.1...1),
            blue: .random(in: 0.1...1),
            alpha: 1.0)
    }
    
    var isMovingBack = true
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        let node = self.atPoint(location)
        
        if node == self {
            let action = self.action(forKey: "changeBgKey")
            action?.speed = self.num
            
        }
        
        node.run(goToCorner)
        
    }
    
    var num: CGFloat = 1
    var goToCorner: SKAction {
        let spacer = round.frame.width * 0.5
        let moveToUpperCorner = SKAction.move(to: .init(x: (frame.maxX - spacer),
                                                        y: (frame.minY + spacer)),
                                              duration: TimeInterval(num))
        
        let moveToLowerCorner = SKAction.move(to: .init(x: (frame.minX + spacer),
                                                        y: (frame.maxY - spacer)),
                                              duration: TimeInterval(num))
        
        let sqnc = SKAction.sequence([moveToLowerCorner, moveToUpperCorner])
        round.run(SKAction.repeatForever(sqnc), withKey: "key")
        
        return sqnc
    }
    
    private func loadSlider() {
        slider.minimumValue = 1
        slider.maximumValue = 4
        view?.addSubview(slider)
        slider.addTarget(self, action: #selector(sliderMoved(_:)), for: .valueChanged)
    }
    
    @objc func sliderMoved(_ sender: UISlider) {
        num = CGFloat(slider.value)
    }
    
}
