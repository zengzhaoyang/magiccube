//
//  MySenceViewController.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/7/1.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import UIKit

class MySenceViewController: MetalViewController, MetalViewControllerDelegate, MagicCubeRenderDelegate {
    
    var worldModeMatrix: Matrix4!
//    var objectToDraw: Cube!
    var objectToDraw: MagicCube!
    let panSensivity: Float = 5.0
    var lastPanLocation: CGPoint!
    
    let kScreenWidth = UIScreen.mainScreen().bounds.size.width
    let kScreenHeight = UIScreen.mainScreen().bounds.size.height
    
    let halfSW = UIScreen.mainScreen().bounds.size.width / 2
    let halfSH = UIScreen.mainScreen().bounds.size.height / 2
    
    var fingerNum: Int = 1
    var firstEnter: Bool = true
    var shouldRender: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worldModeMatrix = Matrix4()
        worldModeMatrix.translate(0.0, y: 0, z: -13)
        worldModeMatrix.rotateAroundX(Matrix4.degreesToRad(30), y: Matrix4.degreesToRad(-45), z: 0.0)
        
        objectToDraw = MagicCube(device: device, commandQ: commandQueue)
        objectToDraw.delegate = self
        self.metalViewControlerDelegate = self
        
        setupGestures()
    }
    
    func renderObjects(drawable: CAMetalDrawable) {
        if shouldRender == true {
            objectToDraw.render(commandQueue, pipelineState: pipelineState, drawable: drawable, projectionMatrix: projectionMatrix, parentModelViewMatrix: worldModeMatrix, clearColor: MTLClearColor(red: 0.0, green: 104.0 / 255, blue: 5.0 / 255, alpha: 0))
        }
        else if firstEnter == true {
            objectToDraw.render(commandQueue, pipelineState: pipelineState, drawable: drawable, projectionMatrix: projectionMatrix, parentModelViewMatrix: worldModeMatrix, clearColor: MTLClearColor(red: 0.0, green: 104.0 / 255, blue: 5.0 / 255, alpha: 0))
            firstEnter = false
        }
    }
    
    func updateLogic(timeSinceLastUpdate: CFTimeInterval) {
        objectToDraw.updateWithDelta(timeSinceLastUpdate)
    }
    
    func setupGestures() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(MySenceViewController.pan(_:)))
        self.view.addGestureRecognizer(pan)
    }
    
    func pan(panGesture: UIPanGestureRecognizer) {
        if panGesture.state == .Changed {

        }
        else if panGesture.state == .Began {
            lastPanLocation = panGesture.locationInView(self.view)
            fingerNum = panGesture.numberOfTouches()
            shouldRender = true
        }
        else if panGesture.state == .Ended {
            let pointInView = panGesture.locationInView(self.view)
            let xDelta = pointInView.x - lastPanLocation.x
            let yDelta = pointInView.y - lastPanLocation.y
            objectToDraw.shouldRoute = true
            
            if abs(yDelta) < 40 {
                if fingerNum == 1 {
                    if pointInView.y < halfSH {
                        if xDelta > 10 {
                            //U'
                            objectToDraw.op = "U"
                            objectToDraw.rev = true
                        }
                        else if xDelta < -10 {
                            //U
                            objectToDraw.op = "U"
                            objectToDraw.rev = false
                        }
                    }
                    else {
                        if xDelta > 10 {
                            //D
                            objectToDraw.op = "D"
                            objectToDraw.rev = false
                        }
                        else if xDelta < -10 {
                            //D'
                            objectToDraw.op = "D"
                            objectToDraw.rev = true
                        }
                    }
                }
                else if fingerNum == 2 {
                    if xDelta > 10 {
                        objectToDraw.op = "y"
                        objectToDraw.rev = true
                    }
                    else if xDelta < -10 {
                        objectToDraw.op = "y"
                        objectToDraw.rev = false
                    }
                }
            }
            
            else {
                if fingerNum == 1 {
                    if yDelta > 0 && xDelta > 40{
                        if pointInView.y > halfSH {
                            //F
                            objectToDraw.op = "F"
                            objectToDraw.rev = false
                        }
                        else {
                            //B'
                            objectToDraw.op = "B"
                            objectToDraw.rev = true
                        }
                    }
                    else if yDelta > 0 && xDelta < -40 {
                        if pointInView.y > halfSH {
                            //R'
                            objectToDraw.op = "R"
                            objectToDraw.rev = true
                        }
                        else {
                            //L
                            objectToDraw.op = "L"
                            objectToDraw.rev = false
                        }
                    }
                    else if yDelta < 0 && xDelta > 40 {
                        if pointInView.y > halfSH {
                            //R
                            objectToDraw.op = "R"
                            objectToDraw.rev = false
                        }
                        else {
                            //L'
                            objectToDraw.op = "L"
                            objectToDraw.rev = true
                        }
                    }
                    else if yDelta < 0 && xDelta < -40 {
                        if pointInView.y > halfSH {
                            //F'
                            objectToDraw.op = "F"
                            objectToDraw.rev = true
                        }
                        else {
                            //B
                            objectToDraw.op = "B"
                            objectToDraw.rev = false
                        }
                    }
                }
                else if fingerNum == 2 {
                    if yDelta > 0 && xDelta > 40 {
                        objectToDraw.op = "z"
                        objectToDraw.rev = false
                    }
                    else if yDelta > 0 && xDelta < -40 {
                        objectToDraw.op = "x"
                        objectToDraw.rev = true
                    }
                    else if yDelta < 0 && xDelta > 40 {
                        objectToDraw.op = "x"
                        objectToDraw.rev = false
                    }
                    else if yDelta < 0 && xDelta < -40 {
                        objectToDraw.op = "z"
                        objectToDraw.rev = true
                    }
                }
            }
            
        }
    }
    
    func setRender() {
        shouldRender = false
    }
}
