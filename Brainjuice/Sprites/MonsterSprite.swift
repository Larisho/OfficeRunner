//
//  MonsterSprite.swift
//  Brainjuice
//
//  Created by Gabriele Bianchet-David on 10/12/16.
//  Copyright © 2016 Gabriele Bianchet-David. All rights reserved.
//

import Foundation
import SpriteKit


public class MonsterSprite: SKSpriteNode {
    public static func newInstance(spriteName: String) -> MonsterSprite {
        let monster = MonsterSprite(imageNamed: spriteName)
        
        monster.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 32, height: 32))
        monster.physicsBody?.affectedByGravity = false
        monster.physicsBody?.isDynamic = false
        monster.physicsBody?.categoryBitMask = MonsterCategory
        monster.physicsBody?.contactTestBitMask = PlayerCategory
        
        monster.physicsBody?.usesPreciseCollisionDetection = true
        
        return monster
    }
}
