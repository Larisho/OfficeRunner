//
//  GameScene.swift
//  Brainjuice
//
//  Created by Gabriele Bianchet-David on 10/10/16.
//  Copyright © 2016 Gabriele Bianchet-David. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var lastUpdateTime : TimeInterval = 0
    let player = PlayerSprite()
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
        self.physicsWorld.contactDelegate = self
        
        player.updatePosition(point: CGPoint(x: frame.midX, y: frame.midY))
        addChild(player)
        
        // Set up the bottom bar on the screen
        let bottomBar = SKShapeNode(rectOf: CGSize(width: size.width, height: 25))
        bottomBar.position = CGPoint(x: size.width / 2, y: 50)
        bottomBar.zPosition = 0
        bottomBar.fillColor = SKColor.black
        bottomBar.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -size.width / 2, y: 0), to: CGPoint(x: size.width, y: 0))
        
        bottomBar.physicsBody?.categoryBitMask = FloorCategory
        //bottomBar.physicsBody?.contactTestBitMask = PlayerCategory
        
        bottomBar.physicsBody?.usesPreciseCollisionDetection = true
        
        addChild(bottomBar)
        
        // Set up the top bar on the screen
        /*let topBar = SKShapeNode(rectOf: CGSize(width: size.width, height: 5))
        topBar.position = CGPoint(x: size.width / 2, y: 250)
        topBar.zPosition = 0
        topBar.fillColor = SKColor.black
        topBar.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -size.width / 2, y: 0), to: CGPoint(x: size.width, y: 0))
        
        topBar.physicsBody?.categoryBitMask = FloorCategory
        topBar.physicsBody?.contactTestBitMask = PlayerCategory
        
        topBar.physicsBody?.usesPreciseCollisionDetection = true
        
        addChild(topBar) */
        
        // Change the background of the screen to white
        backgroundColor = SKColor.white
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == MonsterCategory) {
            // Do something
        } else if (contact.bodyB.categoryBitMask == MonsterCategory) {
            // Do something
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*let touchPoint = touches.first?.location(in: self)
        
        if ((touchPoint?.y)! > CGFloat(260) || (touchPoint?.x)! < CGFloat(40)) {
            return
        }
        
        if let point = touchPoint {
            player.setDestination(destination: point)
        }*/
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.removeAllActions()
        print("Player stopped moving")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*let touchPoint = touches.first?.location(in: self)
        
        if ((touchPoint?.y)! > CGFloat(280) || (touchPoint?.y)! < CGFloat(30)) {
            return
        }
        
        if let point = touchPoint {
            player.setDestination(destination: point)
        }*/
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        self.lastUpdateTime = currentTime
        
        player.update(deltaTime: dt)
    }
    
    func addMonster() {
        
        // Create sprite
        let monster = MonsterSprite.newInstance(spriteName: "monster")
        
        // Determine where to spawn the monster along the Y axis
        let actualY = random(min: 50, max: 250)
        
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        addChild(monster)
        
        // Determine speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y: actualY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.run(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
    
    override func didMove(to view: SKView) {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration: 1.0)
            ])
        ))
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
}
