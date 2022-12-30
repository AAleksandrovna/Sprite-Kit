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
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                //                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill

                // Present the scene
                skView.presentScene(scene)
                //           }
                
                skView.ignoresSiblingOrder = true
                
                skView.showsFPS = true
                skView.showsNodeCount = true
            }
        }
    }
    
    //
    //    override var shouldAutorotate: Bool {
    //        return true
    //    }
    //
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        if UIDevice.current.userInterfaceIdiom == .phone {
    //            return .allButUpsideDown
    //        } else {
    //            return .all
    //        }
    //    }
    //
    //    override var prefersStatusBarHidden: Bool {
    //        return true
    //    }
}
