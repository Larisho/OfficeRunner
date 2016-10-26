//
//  MenuScene.swift
//  Brainjuice
//
//  Created by Gabriele Bianchet-David on 10/12/16.
//  Copyright © 2016 Gabriele Bianchet-David. All rights reserved.
//

import SpriteKit

public class MenuScene: SKScene {
    var selectedButton : SKSpriteNode! = nil
    
    var startButton = SKSpriteNode(imageNamed: "menu_title")
    
    var background = SKSpriteNode(imageNamed: "menu_background")
    
    var desk = SKSpriteNode(imageNamed: "Sleep400X400")
    
    override public func sceneDidLoad() {
        background.zPosition = 0
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)
        
        desk.zPosition = 1
        desk.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 2)
        addChild(desk)
        
        startButton.zPosition = 1
        startButton.position = CGPoint(x: size.width / 2 + 100, y: size.height / 2)
        addChild(startButton)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.reveal(with: .right, duration: 1.00)
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        view?.presentScene(gameScene, transition: transition)
    }
}
