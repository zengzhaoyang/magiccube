//
//  DetectViewController.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/7/7.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import Foundation
import AVFoundation

class DetectViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let captureSession = AVCaptureSession()
    var captureDevice: AVCaptureDevice?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var headImage: UIView?
    var dashline: UIImageView?
    var tmp: Bool = true
    
    let kScreenWidth = UIScreen.mainScreen().bounds.width
    let kScreenHeight = UIScreen.mainScreen().bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashline = UIImageView(frame: CGRectMake(30, 120, kScreenWidth - 60, (kScreenWidth - 60) / 1.732 * 2))
        dashline?.contentMode = .ScaleToFill
        dashline?.image = UIImage(named: "dashline")
        
        
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        let devices = AVCaptureDevice.devices()
        for device in devices {
            if (device.hasMediaType(AVMediaTypeVideo)) {
                if (device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                    if captureDevice != nil {
                        beginSession()
                    }
                }
            }
        }
        self.view.addSubview(dashline!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func beginSession() {
        
        try! captureSession.addInput(AVCaptureDeviceInput(device: captureDevice!))
        let output = AVCaptureVideoDataOutput()
        
        let cameraQueue = dispatch_queue_create("cameraQueue", DISPATCH_QUEUE_SERIAL)
        output.setSampleBufferDelegate(self, queue: cameraQueue)
        let value: NSNumber = NSNumber(unsignedInt: kCVPixelFormatType_32BGRA)
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey: value]
        captureSession.addOutput(output)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        previewLayer?.frame = self.view.bounds
        self.view.layer.addSublayer(previewLayer!)
        captureSession.startRunning()
        
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
//        if tmp == true {
            sampleBufferToImage(sampleBuffer)
//            let width = resultImage.size.width
//            let height = resultImage.size.height
//            print(kScreenWidth, kScreenHeight)
        
            
//            tmp = false
//        }
    }
    
    func sampleBufferToImage(sampleBuffer: CMSampleBuffer) {
        
        let imageBuffer: CVImageBufferRef = CMSampleBufferGetImageBuffer(sampleBuffer)!
        ImageManager.test(imageBuffer)
        
//        let imageBuffer: CVImageBufferRef = CMSampleBufferGetImageBuffer(sampleBuffer)!
//        CVPixelBufferLockBaseAddress(imageBuffer, 0)
//        let baseAddress = CVPixelBufferGetBaseAddress(imageBuffer)
//        
//        let bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer)
//        let width = CVPixelBufferGetWidth(imageBuffer)
//        let height = CVPixelBufferGetHeight(imageBuffer)
//        
//        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
//        
//        let bitsPerCompornent = 8
//        let bitmapInfo = CGBitmapInfo(rawValue: (CGBitmapInfo.ByteOrder32Little.rawValue | CGImageAlphaInfo.PremultipliedFirst.rawValue) as UInt32)
//        
//        let newContext = CGBitmapContextCreate(baseAddress, width, height, bitsPerCompornent, bytesPerRow, colorSpace, bitmapInfo.rawValue)! as CGContextRef
//        
//        let imageRef: CGImageRef = CGBitmapContextCreateImage(newContext)!
//        let resultImage = UIImage(CGImage: imageRef, scale: 1.0, orientation: UIImageOrientation.Right)
//        return resultImage
    }
    
}
