//
//  GameScene.swift
//  Blobies
//
//  Created by Emil Lind on 2015-09-30.
//  Copyright (c) 2015 Emil's app house. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //var World: SKNode!
    //var Camera: SKNode!
    var TheLevel: Level!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.anchorPoint = CGPointMake(0.16, 0);
        
        self.TheLevel = Level(progress: 1);
        TheLevel.position = CGPoint(x: 0, y: 0)
        addChild(TheLevel);
        
        /*self.World = SKNode()
        self.World.name = "World"
        addChild(self.World)
        self.Camera = SKNode()
        self.Camera.name = "Camera"
        self.World.addChild(self.Camera)
        */
        let darkBrownColor = UIColor(red:0.4, green:0.3, blue:0.2, alpha:1);
        let lightBrownColor = UIColor(red:0.6, green:0.5, blue:0.4, alpha:1);
        //self.backgroundColor = darkBrownColor;
        self.backgroundColor = darkBrownColor;
        /*var ground1 = SKShapeNode(rectOfSize: CGSize(width: 130, height: 30));
        ground1.name = "ground1";
        ground1.fillColor = lightBrownColor;
        ground1.position = CGPoint(x: 0, y: 110);
        World.addChild(ground1);
        var ground2 = SKShapeNode(rectOfSize: CGSize(width: 30, height: 30));
        ground2.name = "ground1";
        ground2.fillColor = lightBrownColor;
        ground2.position = CGPoint(x: 115, y: 110);
        World.addChild(ground2);
        let myLabel = SKLabelNode(fontNamed:"Chalkduster");
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        World.addChild(myLabel);*/
        
        
        
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        //TheLevel.Camera.position = CGPoint(x: 700, y: 0)
        TheLevel.moveCamera(300);
        self.didFinishUpdate();
    }
    
    override func didFinishUpdate() {
        
        //TheLevel.Camera.position = CGPoint(x: 700, y: 0)
        TheLevel.moveCamera(300);
        //self.centerOnNode(TheLevel.Camera)
        
    }

    func centerOnNode(node: SKNode) {
        
        //let cameraPositionInScene: CGPoint = node.scene!.convertPoint(node.position, fromNode: World)
        
        //println(cameraPositionInScene);
        
        let cameraPositionInScene: CGPoint = node.scene!.convertPoint(node.position, fromNode: TheLevel)

        
        node.parent!.runAction(SKAction.moveTo(CGPoint(x:node.parent!.position.x - cameraPositionInScene.x, y:node.parent!.position.y - cameraPositionInScene.y), duration: 1))

        
        /*node.parent!.position = CGPoint(x:node.parent!.position.x - cameraPositionInScene.x, y:node.parent!.position.y - cameraPositionInScene.y)
        */
    }
}
