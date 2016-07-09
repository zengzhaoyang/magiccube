//
//  ViewController.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/6/28.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import UIKit
import Metal
import QuartzCore

//class ViewController: UIViewController {
//
//    var device: MTLDevice! = nil
//    var metalLayer: CAMetalLayer! = nil
//    var pipelineState: MTLRenderPipelineState! = nil
//    var commandQueue: MTLCommandQueue! = nil
//    var timer: CADisplayLink! = nil
//    var objectToDraw: Cube!
//    var projectionMatrix: Matrix4!
//    var lastFrameTimestamp: CFTimeInterval = 0.0
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        projectionMatrix = Matrix4.makePerspectiveViewAngle(Matrix4.degreesToRad(85.0), aspectRatio: Float(self.view.bounds.size.width / self.view.bounds.size.height), nearZ: 0.01, farZ: 100)
//        
//        device = MTLCreateSystemDefaultDevice()
//        
//        metalLayer = CAMetalLayer()
//        metalLayer.device = device
//        metalLayer.pixelFormat = .BGRA8Unorm
//        metalLayer.framebufferOnly = true
//        metalLayer.frame = view.layer.frame
//        view.layer.addSublayer(metalLayer)
//        
//        objectToDraw = Cube(device: device, commandQ: commandQueue)
//        
//        let defaultLibrary = device.newDefaultLibrary()
//        let fragmentProgram = defaultLibrary?.newFunctionWithName("basic_fragment")
//        let vertexProgram = defaultLibrary?.newFunctionWithName("basic_vertex")
//        
//        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
//        pipelineStateDescriptor.vertexFunction = vertexProgram
//        pipelineStateDescriptor.fragmentFunction = fragmentProgram
//        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .BGRA8Unorm
//        
//        pipelineState = try? device.newRenderPipelineStateWithDescriptor(pipelineStateDescriptor)
//        
//        commandQueue = device.newCommandQueue()
//        
//        timer = CADisplayLink(target: self, selector: #selector(ViewController.newFrame(_:)))
//        timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
//    }
//    
//    func render() {
//        let drawable = metalLayer.nextDrawable()
//        let worldModelMatrix = Matrix4()
//        worldModelMatrix.translate(0.0, y: 0.0, z: -7.0)
//        worldModelMatrix.rotateAroundX(Matrix4.degreesToRad(25), y: 0.0, z: 0.0)
//        objectToDraw.render(commandQueue, pipelineState: pipelineState, drawable: drawable!, projectionMatrix: projectionMatrix, parentModelViewMatrix: worldModelMatrix, clearColor: MTLClearColor(red: 0.0, green: 104.0 / 255, blue: 5.0 / 255, alpha: 1))
//    }
//    
//    func gameloop(timeSinceLastUpdate: CFTimeInterval) {
//        objectToDraw.updateWithDelta(timeSinceLastUpdate)
//        autoreleasepool { 
//            self.render()
//        }
//    }
//    
//    func newFrame(displayLink: CADisplayLink) {
//        if lastFrameTimestamp == 0.0 {
//            lastFrameTimestamp = displayLink.timestamp
//        }
//        
//        var elapsed: CFTimeInterval = displayLink.timestamp - lastFrameTimestamp
//        lastFrameTimestamp = displayLink.timestamp
//        gameloop(elapsed)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
//    
//}

