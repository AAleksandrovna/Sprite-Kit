//
//  GameViewController.swift
//  newSpriteKitHW
//
//  Created by Анастасия Восколович on 28.12.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGameVC()
        
    }
    
    private func setupGameVC () {
        
        if let skView = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .resizeFill
            
            // Present the scene
            skView.presentScene(scene)
            
            skView.ignoresSiblingOrder = true
            skView.showsFPS = true
            skView.showsNodeCount = true
        }
    }
}
