//
//  Vertex.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/6/29.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import Foundation

class Vertex {
    var x, y, z: Float!
    var r, g, b, a: Float!
    var s, t: Float!
    
    init() {
        x = 0
        y = 0
        z = 0
        r = 0
        g = 0
        b = 0
        a = 0
        s = 0
        t = 0
    }
    
    init(x: Float, y: Float, z: Float, r: Float, g: Float, b: Float, a: Float, s: Float, t: Float) {
        self.x = x
        self.y = y
        self.z = z
        self.r = r
        self.g = g
        self.b = b
        self.a = a
        self.s = s
        self.t = t
    }
    
    func set(x: Float, y: Float, z: Float, r: Float, g: Float, b: Float, a: Float, s: Float, t: Float) {
        self.x = x
        self.y = y
        self.z = z
        self.r = r
        self.g = g
        self.b = b
        self.a = a
        self.s = s
        self.t = t
    }
    
    func cc() {

        z = z + 1
    }
    
    func floatBuffer() -> [Float] {
        return [x, y, z, r, g, b ,a, s, t]
    }
}