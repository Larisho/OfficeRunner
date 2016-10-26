//
//  PlayerSprite.swift
//  Brainjuice
//
//  Created by Gabriele Bianchet-David on 10/11/16.
//  Copyright © 2016 Gabriele Bianchet-David. All rights reserved.
//

import Foundation
import SpriteKit


public class PlayerSprite: SKSpriteNode {
    
    private var destination : CGPoint!
    private let easing : CGFloat = 0.1
    
    // contains the sprite sheet for this dude
    var dudeWalkingFrames : [SKTexture]!
    
    
    
    
    // this is here because i dunno
    override init(texture: SKTexture!, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    // this too :/
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // constructor that I'm actually using
    convenience init () {
        self.init()
        
        let dudeAtlas = SKTextureAtlas(named: "WalkSeq")
        var walkFrames = [SKTexture]()
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 27, height: 100))
        self.physicsBody?.affectedByGravity = true // writing true makes it very funny
        self.physicsBody?.isDynamic = true
        
        self.physicsBody?.categoryBitMask = PlayerCategory
        self.physicsBody?.contactTestBitMask = MonsterCategory
        
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        let frames = dudeAtlas.textureNames.count
        
        for i in 1...frames {
            let dudeTextureName: String
            
            if i < 10 {
                dudeTextureName = "WalkSEQ000\(i)"
            }
            else {
                dudeTextureName = "WalkSEQ00\(i)"
            }
            walkFrames.append(dudeAtlas.textureNamed(dudeTextureName))
        }
        
        dudeWalkingFrames = walkFrames

    }
    
    // Makes the dude start running
    public func run() {
        self.run(SKAction.repeatForever(SKAction.animate(with: dudeWalkingFrames, timePerFrame: 0.1)), withKey:"runningDude")
    }
    
    // Updates the position of the sprite
    public func updatePosition(point : CGPoint) {
        position = point
        destination = point
    }
    
    // Sets the destination of the movement
    public func setDestination(destination : CGPoint) {
        self.destination = destination
    }
    
    // Updates the position of the player
    public func update(deltaTime : TimeInterval) {
        run()
        /*let distance = sqrt(pow((destination.x - position.x), 2) + pow((destination.y - position.y), 2))
        
        if(distance > 1) {
            let directionX = (destination.x - position.x)
            let directionY = (destination.y - position.y)
            
            position.x += directionX * easing
            position.y += directionY * easing
        } else {
            position = destination;
        }*/
    }
}
