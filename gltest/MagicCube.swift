//
//  MagicCube.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/7/4.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import Foundation

protocol MagicCubeRenderDelegate {
    func setRender()
}

class MagicCube: Node {
    
    var cubes: [Cube] = Array<Cube>()
    var cubesSort: [Cube] = Array<Cube>()
//    var colors: [[Int]] = Array<Array<Int>>(count: 6, repeatedValue: Array<Int>(count: 9, repeatedValue: 0))
    var cubeCore: MagicCubeCore!
    
    var verticesArray: [Vertex]?
    var shouldRoute: Bool = false
    var routeCnt: Int = 0
    var op: Character!
    var rev: Bool!
    
    var delegate: MagicCubeRenderDelegate?
    
    init(device: MTLDevice, commandQ: MTLCommandQueue) {
        
        cubeCore = MagicCubeCore()
        
        cubes = [
            Cube(colors: [cubeCore.face[0][6], 6, cubeCore.face[2][0], 6, cubeCore.face[4][2], 6], position: 0),
            Cube(colors: [cubeCore.face[0][7], 6, cubeCore.face[2][1], 6, 6, 6], position: 1),
            Cube(colors: [cubeCore.face[0][8], 6, cubeCore.face[2][2], 6, 6, cubeCore.face[5][0]], position: 2),
            Cube(colors: [6, 6, cubeCore.face[2][3], 6, cubeCore.face[4][5], 6], position: 3),
            Cube(colors: [6, 6, cubeCore.face[2][4], 6, 6, 6], position: 4),
            Cube(colors: [6, 6, cubeCore.face[2][5], 6, 6, cubeCore.face[5][3]], position: 5),
            Cube(colors: [6, cubeCore.face[1][0], cubeCore.face[2][6], 6, cubeCore.face[4][8], 6], position: 6),
            Cube(colors: [6, cubeCore.face[1][1], cubeCore.face[2][7], 6, 6, 6], position: 7),
            Cube(colors: [6, cubeCore.face[1][2], cubeCore.face[2][8], 6, 6, cubeCore.face[5][6]], position: 8),
            
            Cube(colors: [cubeCore.face[0][3], 6, 6, 6, cubeCore.face[4][1], 6], position: 9),
            Cube(colors: [cubeCore.face[0][4], 6, 6, 6, 6, 6], position: 10),
            Cube(colors: [cubeCore.face[0][5], 6, 6, 6, 6, cubeCore.face[5][1]], position: 11),
            Cube(colors: [6, 6, 6, 6, cubeCore.face[4][4], 6], position: 12),
            Cube(colors: [6, 6, 6, 6, 6, 6], position: 13),
            Cube(colors: [6, 6, 6, 6, 6, cubeCore.face[5][4]], position: 14),
            Cube(colors: [6, cubeCore.face[1][3], 6, 6, cubeCore.face[4][7], 6], position: 15),
            Cube(colors: [6, cubeCore.face[1][4], 6, 6, 6, 6], position: 16),
            Cube(colors: [6, cubeCore.face[1][5], 6, 6, 6, cubeCore.face[5][7]], position: 17),
            
            Cube(colors: [cubeCore.face[0][0], 6, 6, cubeCore.face[3][2], cubeCore.face[4][0], 6], position: 18),
            Cube(colors: [cubeCore.face[0][1], 6, 6, cubeCore.face[3][1], 6, 6], position: 19),
            Cube(colors: [cubeCore.face[0][2], 6, 6, cubeCore.face[3][0], 6, cubeCore.face[5][2]], position: 20),
            Cube(colors: [6, 6, 6, cubeCore.face[3][5], cubeCore.face[4][3], 6], position: 21),
            Cube(colors: [6, 6, 6, cubeCore.face[3][4], 6, 6], position: 22),
            Cube(colors: [6, 6, 6, cubeCore.face[3][3], 6, cubeCore.face[5][5]], position: 23),
            Cube(colors: [6, cubeCore.face[1][6], 6, cubeCore.face[3][8], cubeCore.face[4][6], 6], position: 24),
            Cube(colors: [6, cubeCore.face[1][7], 6, cubeCore.face[3][7], 6, 6], position: 25),
            Cube(colors: [6, cubeCore.face[1][8], 6, cubeCore.face[3][6], 6, cubeCore.face[5][8]], position: 26)
        ]
        
        for i in 0 ..< cubes.count {
            cubesSort.append(cubes[i])
        }
        
        let defa = Vertex(x: 0, y: 0, z: 0, r: 0, g: 0, b: 0, a: 0, s: 0, t: 0)
        verticesArray = Array<Vertex>(count: 972, repeatedValue: defa)
        var cnt = 0
        for item in 0 ..< cubes.count {
            for i in 0 ..< cubes[item].verticesBlackArray.count {
                verticesArray![cnt] = cubes[item].verticesBlackArray[i]
                cnt += 1
            }
        }
        for item in 0 ..< cubes.count {
            for i in 0 ..< cubes[item].verticesArray.count {
                verticesArray![cnt] = cubes[item].verticesArray[i]
                cnt += 1
            }
        }
        
        let texture = MetalTexture(resourceName: "b", ext: "png", mipmaped: true)
        texture.loadTexture(device: device, commandQ: commandQ, flip: true)
        super.init(name: "MagicCube", vertices: verticesArray!, device: device, texture: texture.texture)
        
        
    }
    
    func test() {
//        for j in 0 ..< 90 {
//            for i in 0 ..< 9 {
//                cubes[i].aa(1)
//            }
//            
//            updateVertices(verticesArray!)
//        }
        
    }
    
    override func updateWithDelta(delta: CFTimeInterval) {
        super.updateWithDelta(delta)
        if shouldRoute == true {
            if rev == true {
                if op == "U" {
                    for i in 0 ..< 3 {
                        cubes[i * 9].routey(-9)
                        cubes[i * 9 + 1].routey(-9)
                        cubes[i * 9 + 2].routey(-9)
                    }
                }
                else if op == "D" {
                    for i in 0 ..< 3 {
                        cubes[i * 9 + 6].routey(9)
                        cubes[i * 9 + 7].routey(9)
                        cubes[i * 9 + 8].routey(9)
                    }
                }
                else if op == "F" {
                    for i in 0 ..< 9 {
                        cubes[i].routez(9)
                    }
                }
                else if op == "B" {
                    for i in 18 ..< 27 {
                        cubes[i].routez(-9)
                    }
                }
                else if op == "L" {
                    for i in 0 ..< 3 {
                        cubes[i * 9].routex(-9)
                        cubes[i * 9 + 3].routex(-9)
                        cubes[i * 9 + 6].routex(-9)
                    }
                }
                else if op == "R" {
                    for i in 0 ..< 3 {
                        cubes[i * 9 + 2].routex(9)
                        cubes[i * 9 + 5].routex(9)
                        cubes[i * 9 + 8].routex(9)
                    }
                }
                else if op == "x" {
                    for i in 0 ..< 27 {
                        cubes[i].routex(9)
                    }
                }
                else if op == "y" {
                    for i in 0 ..< 27 {
                        cubes[i].routey(-9)
                    }
                }
                else if op == "z" {
                    for i in 0 ..< 27 {
                        cubes[i].routez(9)
                    }
                }
            }
            else {
                if op == "U" {
                    for i in 0 ..< 3 {
                        cubes[i * 9].routey(9)
                        cubes[i * 9 + 1].routey(9)
                        cubes[i * 9 + 2].routey(9)
                    }
                }
                else if op == "D" {
                    for i in 0 ..< 3 {
                        cubes[i * 9 + 6].routey(-9)
                        cubes[i * 9 + 7].routey(-9)
                        cubes[i * 9 + 8].routey(-9)
                    }
                }
                else if op == "F" {
                    for i in 0 ..< 9 {
                        cubes[i].routez(-9)
                    }
                }
                else if op == "B" {
                    for i in 18 ..< 27 {
                        cubes[i].routez(9)
                    }
                }
                else if op == "L" {
                    for i in 0 ..< 3 {
                        cubes[i * 9].routex(9)
                        cubes[i * 9 + 3].routex(9)
                        cubes[i * 9 + 6].routex(9)
                    }
                }
                else if op == "R" {
                    for i in 0 ..< 3 {
                        cubes[i * 9 + 2].routex(-9)
                        cubes[i * 9 + 5].routex(-9)
                        cubes[i * 9 + 8].routex(-9)
                    }
                }
                else if op == "x" {
                    for i in 0 ..< 27 {
                        cubes[i].routex(-9)
                    }
                }
                else if op == "y" {
                    for i in 0 ..< 27 {
                        cubes[i].routey(9)
                    }
                }
                else if op == "z" {
                    for i in 0 ..< 27 {
                        cubes[i].routez(-9)
                    }
                }
            }
            
            if op == "F" || op == "B" {
                cubesSort.sortInPlace({ (c1, c2) -> Bool in
                    return c1.position / 9 > c2.position / 9
                })
            }
            else if op == "L" || op == "R" {
                cubesSort.sortInPlace({ (c1, c2) -> Bool in
                    return c1.position % 9 % 3 < c2.position % 9 % 3
                })
            }
            else if op == "U" || op == "D" {
                cubesSort.sortInPlace({ (c1, c2) -> Bool in
                    return c1.position % 9 / 3 > c2.position % 9 / 3
                })
            }
            
            
            updateVertices(cubesSort)
            routeCnt += 9
            if routeCnt == 99 {
                shouldRoute = false
                routeCnt = 0
                
                cubeCore.change(op, rev: rev)
                
                cubes[0].reset([cubeCore.face[0][6], 6, cubeCore.face[2][0], 6, cubeCore.face[4][2], 6], position: 0)
                cubes[1].reset([cubeCore.face[0][7], 6, cubeCore.face[2][1], 6, 6, 6], position: 1)
                cubes[2].reset([cubeCore.face[0][8], 6, cubeCore.face[2][2], 6, 6, cubeCore.face[5][0]], position: 2)
                cubes[3].reset([6, 6, cubeCore.face[2][3], 6, cubeCore.face[4][5], 6], position: 3)
                cubes[4].reset([6, 6, cubeCore.face[2][4], 6, 6, 6], position: 4)
                cubes[5].reset([6, 6, cubeCore.face[2][5], 6, 6, cubeCore.face[5][3]], position: 5)
                cubes[6].reset([6, cubeCore.face[1][0], cubeCore.face[2][6], 6, cubeCore.face[4][8], 6], position: 6)
                cubes[7].reset([6, cubeCore.face[1][1], cubeCore.face[2][7], 6, 6, 6], position: 7)
                cubes[8].reset([6, cubeCore.face[1][2], cubeCore.face[2][8], 6, 6, cubeCore.face[5][6]], position: 8)
                cubes[9].reset([cubeCore.face[0][3], 6, 6, 6, cubeCore.face[4][1], 6], position: 9)
                cubes[10].reset([cubeCore.face[0][4], 6, 6, 6, 6, 6], position: 10)
                cubes[11].reset([cubeCore.face[0][5], 6, 6, 6, 6, cubeCore.face[5][1]], position: 11)
                cubes[12].reset([6, 6, 6, 6, cubeCore.face[4][4], 6], position: 12)
                cubes[13].reset([6, 6, 6, 6, 6, 6], position: 13)
                cubes[14].reset([6, 6, 6, 6, 6, cubeCore.face[5][4]], position: 14)
                cubes[15].reset([6, cubeCore.face[1][3], 6, 6, cubeCore.face[4][7], 6], position: 15)
                cubes[16].reset([6, cubeCore.face[1][4], 6, 6, 6, 6], position: 16)
                cubes[17].reset([6, cubeCore.face[1][5], 6, 6, 6, cubeCore.face[5][7]], position: 17)
                cubes[18].reset([cubeCore.face[0][0], 6, 6, cubeCore.face[3][2], cubeCore.face[4][0], 6], position: 18)
                cubes[19].reset([cubeCore.face[0][1], 6, 6, cubeCore.face[3][1], 6, 6], position: 19)
                cubes[20].reset([cubeCore.face[0][2], 6, 6, cubeCore.face[3][0], 6, cubeCore.face[5][2]], position: 20)
                cubes[21].reset([6, 6, 6, cubeCore.face[3][5], cubeCore.face[4][3], 6], position: 21)
                cubes[22].reset([6, 6, 6, cubeCore.face[3][4], 6, 6], position: 22)
                cubes[23].reset([6, 6, 6, cubeCore.face[3][3], 6, cubeCore.face[5][5]], position: 23)
                cubes[24].reset([6, cubeCore.face[1][6], 6, cubeCore.face[3][8], cubeCore.face[4][6], 6], position: 24)
                cubes[25].reset([6, cubeCore.face[1][7], 6, cubeCore.face[3][7], 6, 6], position: 25)
                cubes[26].reset([6, cubeCore.face[1][8], 6, cubeCore.face[3][6], 6, cubeCore.face[5][8]], position: 26)
                cubesSort.removeAll()
                for i in 0 ..< cubes.count {
                    cubesSort.append(cubes[i])
                }
                updateVertices(cubesSort)
                delegate?.setRender()
            }
        }
    }
    
    
    
}