//
//  Cube.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/6/29.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import Foundation

class Cube {
    
    let sPosition: [Float] = [0, 1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1]
    var vertices: [Vertex]!
    var verticesArray: [Vertex] = []
    var verticesBlackArray: [Vertex] = []
    var position: Int!
    var face: [[Int]] = [
        [1, 0, 1, 0, 1, 0],
        [1, 0, 1, 0, 0, 0],
        [1, 0, 1, 0, 0, 1],
        [0, 0, 1, 0, 1, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 1],
        [0, 1, 1, 0, 1, 0],
        [0, 1, 1, 0, 0, 0],
        [0, 1, 1, 0, 0, 1],
        [1, 0, 0, 0, 1, 0],
        [1, 0, 0, 0, 0, 0],
        [1, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 1, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 1],
        [0, 1, 0, 0, 1, 0],
        [0, 1, 0, 0, 0, 0],
        [0, 1, 0, 0, 0, 1],
        [1, 0, 0, 1, 1, 0],
        [1, 0, 0, 1, 0, 0],
        [1, 0, 0, 1, 0, 1],
        [0, 0, 0, 1, 1, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 1, 0, 1],
        [0, 1, 0, 1, 1, 0],
        [0, 1, 0, 1, 0, 0],
        [0, 1, 0, 1, 0, 1]
    ]
    
    init(colors: [Int], position: Int) {
        
        self.position = position
        
        let idx = position % 9
        let dep = position / 9
        let offsetx = -1.5 + Float(idx % 3)
        let offsety = 0.5 - Float(idx / 3)
        let offsetz = 0.5 - Float(dep)
        
        let defaultVertex = Vertex(x: 0, y: 0, z: 0, r: 0, g: 0, b: 0, a: 0, s: 0, t: 0)
        vertices = Array<Vertex>(count: 24, repeatedValue: defaultVertex)
        
        
        vertices[0] = Vertex(x: 0 + offsetx , y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0]], t: 0)
        vertices[1] = Vertex(x: 0 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0]], t: 1)
        vertices[2] = Vertex(x: 1 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0] + 1], t: 1)
        vertices[3] = Vertex(x: 1 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0] + 1], t: 0)
        
        vertices[4] = Vertex(x: 0 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1]], t: 0)
        vertices[5] = Vertex(x: 0 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1]], t: 1)
        vertices[6] = Vertex(x: 1 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1] + 1], t: 1)
        vertices[7] = Vertex(x: 1 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1] + 1], t: 0)
        
        vertices[8] = Vertex(x: 0 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2]], t: 0)
        vertices[9] = Vertex(x: 0 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2]], t: 1)
        vertices[10] = Vertex(x: 1 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2] + 1], t: 1)
        vertices[11] = Vertex(x: 1 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2] + 1], t: 0)
        
        vertices[12] = Vertex(x: 1 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3]], t: 0)
        vertices[13] = Vertex(x: 1 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3]], t: 1)
        vertices[14] = Vertex(x: 0 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3] + 1], t: 1)
        vertices[15] = Vertex(x: 0 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3] + 1], t: 0)
        
        vertices[16] = Vertex(x: 0 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4]], t: 0)
        vertices[17] = Vertex(x: 0 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4]], t: 1)
        vertices[18] = Vertex(x: 0 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4] + 1], t: 1)
        vertices[19] = Vertex(x: 0 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4] + 1], t: 0)
        
        vertices[20] = Vertex(x: 1 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5]], t: 0)
        vertices[21] = Vertex(x: 1 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5]], t: 1)
        vertices[22] = Vertex(x: 1 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5] + 1], t: 1)
        vertices[23] = Vertex(x: 1 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5] + 1], t: 0)
        
        let A = vertices[0]
        let B = vertices[1]
        let C = vertices[2]
        let D = vertices[3]
        let E = vertices[4]
        let F = vertices[5]
        let G = vertices[6]
        let H = vertices[7]
        let I = vertices[8]
        let J = vertices[9]
        let K = vertices[10]
        let L = vertices[11]
        let M = vertices[12]
        let N = vertices[13]
        let O = vertices[14]
        let P = vertices[15]
        let Q = vertices[16]
        let R = vertices[17]
        let S = vertices[18]
        let T = vertices[19]
        let U = vertices[20]
        let V = vertices[21]
        let W = vertices[22]
        let X = vertices[23]
        

        let tempVertices = [
            [A,B,C,A,C,D],
            [E,F,G,E,G,H],
            [I,J,K,I,K,L],
            [M,N,O,M,O,P],
            [Q,R,S,Q,S,T],
            [U,V,W,U,W,X]
        ]
        
        for i in 0 ..< 6 {
            if face[position][i] == 1 {
                for item in tempVertices[i] {
                    verticesArray.append(item)
                }
            }
            else {
                for item in tempVertices[i] {
                    verticesBlackArray.append(item)
                }
            }
        }
        
    }
    
    func routez(degree: Float) {
        let rad: Float = degree * 2 * Float(M_PI) / 360.0
        for i in 0 ..< 24 {
            let tmpx = vertices[i].x
            let tmpy = vertices[i].y
            vertices[i].x = tmpx * cos(rad) - tmpy * sin(rad)
            vertices[i].y = tmpx * sin(rad) + tmpy * cos(rad)
        }
    }
    
    func routex(degree: Float) {
        let rad: Float = degree * 2 * Float(M_PI) / 360.0
        for i in 0 ..< 24 {
            let tmpy = vertices[i].y
            let tmpz = vertices[i].z
            vertices[i].y = tmpy * cos(rad) - tmpz * sin(rad)
            vertices[i].z = tmpy * sin(rad) + tmpz * cos(rad)
        }
    }
    
    func routey(degree: Float) {
        let rad: Float = degree * 2 * Float(M_PI) / 360.0
        for i in 0 ..< 24 {
            let tmpx = vertices[i].x
            let tmpz = vertices[i].z
            vertices[i].x = tmpx * cos(rad) - tmpz * sin(rad)
            vertices[i].z = tmpx * sin(rad) + tmpz * cos(rad)
        }
    }
    
    func reset(colors: [Int], position: Int) {
        let idx = position % 9
        let dep = position / 9
        let offsetx = -1.5 + Float(idx % 3)
        let offsety = 0.5 - Float(idx / 3)
        let offsetz = 0.5 - Float(dep)
        
        vertices[0].set(0 + offsetx , y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0]], t: 0)
        vertices[1].set(0 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0]], t: 1)
        vertices[2].set(1 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0] + 1], t: 1)
        vertices[3].set(1 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[0] + 1], t: 0)
        
        vertices[4].set(0 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1]], t: 0)
        vertices[5].set(0 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1]], t: 1)
        vertices[6].set(1 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1] + 1], t: 1)
        vertices[7].set(1 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[1] + 1], t: 0)
        
        vertices[8].set(0 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2]], t: 0)
        vertices[9].set(0 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2]], t: 1)
        vertices[10].set(1 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2] + 1], t: 1)
        vertices[11].set(1 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[2] + 1], t: 0)
        
        vertices[12].set(1 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3]], t: 0)
        vertices[13].set(1 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3]], t: 1)
        vertices[14].set(0 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3] + 1], t: 1)
        vertices[15].set(0 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[3] + 1], t: 0)
        
        vertices[16].set(0 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4]], t: 0)
        vertices[17].set(0 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4]], t: 1)
        vertices[18].set(0 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4] + 1], t: 1)
        vertices[19].set(0 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[4] + 1], t: 0)
        
        vertices[20].set(1 + offsetx, y: 1 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5]], t: 0)
        vertices[21].set(1 + offsetx, y: 0 + offsety, z: 1 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5]], t: 1)
        vertices[22].set(1 + offsetx, y: 0 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5] + 1], t: 1)
        vertices[23].set(1 + offsetx, y: 1 + offsety, z: 0 + offsetz, r: 0, g: 0, b: 0, a: 1, s: sPosition[colors[5] + 1], t: 0)
    }
    
//    override func updateWithDelta(delta: CFTimeInterval) {
//        super.updateWithDelta(delta)
//        
//        let secsPerMove: Float = 6.0
//        rotationY = sinf(Float(time) * 2.0 * Float(M_PI) / secsPerMove)
//        rotationX = sinf(Float(time) * 2.0 * Float(M_PI) / secsPerMove)
//    }
    
}

//        let offset: Float = 0.25 / 3
//        //Front
//        for i in 0 ..< 16 {
//            F.append(Vertex(x: -1.5 + Float(i % 4), y: 1.5 - Float(i / 4), z: 1.5, r: 0, g: 0, b: 0, a: 1, s: 0.25 + offset * Float(i % 4), t: 0.25 + offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            F.append(Vertex(x: -1.5 + Float(i % 4), y: 1.5 - Float(i / 4), z: 0.5, r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            F.append(Vertex(x: -1.5 + Float(i % 4), y: 1.5 - Float(i / 4), z: -0.5, r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//
//        //Left
//        for i in 0 ..< 16 {
//            L.append(Vertex(x: -1.5, y: 1.5 - Float(i / 4), z: -1.5 + Float(i % 4), r: 0, g: 0, b: 0, a: 1, s: 0 + offset * Float(i % 4), t: 0.25 + offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            L.append(Vertex(x: -0.5, y: 1.5 - Float(i / 4), z: -1.5 + Float(i % 4), r: 0, g: 0, b: 0, a: 1,s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            L.append(Vertex(x: 0.5, y: 1.5 - Float(i / 4), z: -1.5 + Float(i % 4), r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//
//        //Right
//        for i in 0 ..< 16 {
//            R.append(Vertex(x: 1.5, y: 1.5 - Float(i / 4), z: 1.5 - Float(i % 4), r: 0, g: 0, b: 0, a: 1, s: 0.5 + offset * Float(i % 4), t: 0.25 + offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            R.append(Vertex(x: 0.5, y: 1.5 - Float(i / 4), z: 1.5 - Float(i % 4), r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//             R.append(Vertex(x: -0.5, y: 1.5 - Float(i / 4), z: 1.5 - Float(i % 4), r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//
//        //Top
//        for i in 0 ..< 16 {
//            U.append(Vertex(x: -1.5 + Float(i % 4), y: 1.5, z: -1.5 + Float(i / 4), r: 0, g: 0, b: 0, a: 1, s: 0.25 + offset * Float(i % 4), t: 0 + offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            U.append(Vertex(x: -1.5 + Float(i % 4), y: 0.5, z: -1.5 + Float(i / 4), r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            U.append(Vertex(x: -1.5 + Float(i % 4), y: -0.5, z: -1.5 + Float(i / 4), r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//
//        //Bot
//        for i in 0 ..< 16 {
//            D.append(Vertex(x: -1.5 + Float(i % 4), y: -1.5, z: 1.5 - Float(i / 4), r: 0, g: 0, b: 0, a: 1, s: 0.25 + offset * Float(i % 4), t: 0.5 + offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            D.append(Vertex(x: -1.5 + Float(i % 4), y: -0.5, z: 1.5 - Float(i / 4), r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            D.append(Vertex(x: -1.5 + Float(i % 4), y: 0.5, z: 1.5 - Float(i / 4), r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//
//        //Back
//        for i in 0 ..< 16 {
//            B.append(Vertex(x: 1.5 - Float(i % 4), y: 1.5 - Float(i / 4), z: -1.5, r: 0, g: 0, b: 0, a: 1, s: 0.75 + offset * Float(i % 4), t: 0.25 + offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            B.append(Vertex(x: 1.5 - Float(i % 4), y: 1.5 - Float(i / 4), z: -0.5, r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//        for i in 0 ..< 16 {
//            B.append(Vertex(x: 1.5 - Float(i % 4), y: 1.5 - Float(i / 4), z: 0.5, r: 0, g: 0, b: 0, a: 1, s: offset * Float(i % 4), t: offset * Float(i / 4)))
//        }
//
//        var verticesArray: [Vertex] = Array<Vertex>()
//
//        for i in 0 ..< 9 {
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 16])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3 + 1 + 16])
//
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 32])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3 + 1 + 32])
//        }
//        for i in 0 ..< 9 {
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 16])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3 + 1 + 16])
//
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 32])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3 + 1 + 32])
//        }
//        for i in 0 ..< 9 {
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 16])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3 + 1 + 16])
//
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 32])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3 + 1 + 32])
//        }
//        for i in 0 ..< 9 {
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 16])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3 + 1 + 16])
//
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 32])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3 + 1 + 32])
//        }
//        for i in 0 ..< 9 {
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 16])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3 + 1 + 16])
//
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 32])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3 + 1 + 32])
//        }
//        for i in 0 ..< 9 {
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 16])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 1 + 16])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3 + 16])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3 + 1 + 16])
//
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 32])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 1 + 32])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3 + 32])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3 + 1 + 32])
//        }
//
//        for i in 0 ..< 9 {
//            verticesArray.append(F[4 * (i / 3) + i % 3])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(F[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(F[4 * (i / 3 + 1) + i % 3 + 1])
//        }
//
//        for i in 0 ..< 9 {
//            verticesArray.append(L[4 * (i / 3) + i % 3])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(L[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(L[4 * (i / 3 + 1) + i % 3 + 1])
//        }
//
//        for i in 0 ..< 9 {
//            verticesArray.append(R[4 * (i / 3) + i % 3])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(R[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(R[4 * (i / 3 + 1) + i % 3 + 1])
//        }
//
//        for i in 0 ..< 9 {
//            verticesArray.append(U[4 * (i / 3) + i % 3])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(U[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(U[4 * (i / 3 + 1) + i % 3 + 1])
//        }
//
//        for i in 0 ..< 9 {
//            verticesArray.append(D[4 * (i / 3) + i % 3])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(D[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(D[4 * (i / 3 + 1) + i % 3 + 1])
//        }
//
//        for i in 0 ..< 9 {
//            verticesArray.append(B[4 * (i / 3) + i % 3])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(B[4 * (i / 3) + i % 3 + 1])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3])
//            verticesArray.append(B[4 * (i / 3 + 1) + i % 3 + 1])
//        }
        