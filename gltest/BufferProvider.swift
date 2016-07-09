//
//  BufferProvider.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/6/30.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import Foundation
import Metal

class BufferProvider {
    var inflightBuffersCount: Int!
    private var uniformsBuffers: [MTLBuffer]!
    private var avaliableBufferIndex: Int = 0
    var avaliableResourcesSemaphore: dispatch_semaphore_t
    
    init(device: MTLDevice, inflightBuffersCount: Int, sizeofUniformsBuffer: Int) {
        self.inflightBuffersCount = inflightBuffersCount
        uniformsBuffers = [MTLBuffer]()
        
        for _ in 0 ... inflightBuffersCount - 1 {
            let uniformsBuffer = device.newBufferWithLength(sizeofUniformsBuffer, options: [])
            uniformsBuffers.append(uniformsBuffer)
        }
        avaliableResourcesSemaphore = dispatch_semaphore_create(inflightBuffersCount)
    }
    
    deinit {
        for _ in 0 ... self.inflightBuffersCount {
            dispatch_semaphore_signal(self.avaliableResourcesSemaphore)
        }
    }
    
    func nextUniformsBuffer(projectionMatrix: Matrix4, modelViewMatrix: Matrix4) -> MTLBuffer {
        
        let buffer = uniformsBuffers[avaliableBufferIndex]
        let bufferPointer = buffer.contents()
        memcpy(bufferPointer, modelViewMatrix.raw(), sizeof(Float)*Matrix4.numberOfElements())
        memcpy(bufferPointer + sizeof(Float)*Matrix4.numberOfElements(), projectionMatrix.raw(), sizeof(Float)*Matrix4.numberOfElements())
        avaliableBufferIndex += 1
        if avaliableBufferIndex == inflightBuffersCount {
            avaliableBufferIndex = 0
        }
        return buffer
        
    }
    
}