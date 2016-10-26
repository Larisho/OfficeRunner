//
//  GameViewController.swift
//  Brainjuice
//
//  Created by Gabriele Bianchet-David on 10/10/16.
//  Copyright © 2016 Gabriele Bianchet-David. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        // Call super's "On load" function
        super.viewDidLoad()
        
        // Set the scene, if you know what I mean
        let scene = MenuScene(size: view.bounds.size)
        
        // Defining the view as an SpriteKitView instead of the default view
        let skView = view as! SKView
        
        // Show frames per second
        skView.showsFPS = true
        
        // Show the physics
        skView.showsPhysics = true
        
        // Show the node count
        skView.showsNodeCount = true
        
        // Ignoring sibling order (whatever that means...)
        skView.ignoresSiblingOrder = true
        
        // Telling the scene how to scale the scene to the actual size of the SKView
        scene.scaleMode = .resizeFill
        
        // Start the scene
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
