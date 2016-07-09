//
//  MagicCubeCore.swift
//  gltest
//
//  Created by ZengZhaoyang on 16/7/6.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

import Foundation

class MagicCubeCore {
    
    var face: [[Int]] = Array<Array<Int>>(count: 6, repeatedValue: Array<Int>(count: 9, repeatedValue: 0))
    
    init() {
        
        for i in 0 ..< 6 {
            for j in 0 ..< 9 {
                face[i][j] = i
            }
        }
        
    }
    
    func changeLoop(inout p1: Int, inout p2: Int, inout p3: Int, inout p4: Int) {
        let temp = p1
        p1 = p4
        p4 = p3
        p3 = p2
        p2 = temp
    }
    
    func change(op: Character, rev: Bool) {
        if rev == false {
            if op == "U" {
                // U
                changeLoop(&face[2][0], p2: &face[4][0], p3: &face[3][0], p4: &face[5][0]);
                changeLoop(&face[2][1], p2: &face[4][1], p3: &face[3][1], p4: &face[5][1]);
                changeLoop(&face[2][2], p2: &face[4][2], p3: &face[3][2], p4: &face[5][2]);
                changeLoop(&face[0][0], p2: &face[0][2], p3: &face[0][8], p4: &face[0][6]);
                changeLoop(&face[0][1], p2: &face[0][5], p3: &face[0][7], p4: &face[0][3]);
            }
            else if op == "D" {
                // D
                changeLoop(&face[2][6], p2: &face[5][6], p3: &face[3][6], p4: &face[4][6]);
                changeLoop(&face[2][7], p2: &face[5][7], p3: &face[3][7], p4: &face[4][7]);
                changeLoop(&face[2][8], p2: &face[5][8], p3: &face[3][8], p4: &face[4][8]);
                changeLoop(&face[1][0], p2: &face[1][2], p3: &face[1][8], p4: &face[1][6]);
                changeLoop(&face[1][1], p2: &face[1][5], p3: &face[1][7], p4: &face[1][3]);
            }
            else if op == "R" {
                // R
                changeLoop(&face[2][2], p2: &face[0][2], p3: &face[3][6], p4: &face[1][2]);
                changeLoop(&face[2][5], p2: &face[0][5], p3: &face[3][3], p4: &face[1][5]);
                changeLoop(&face[2][8], p2: &face[0][8], p3: &face[3][0], p4: &face[1][8]);
                changeLoop(&face[5][0], p2: &face[5][2], p3: &face[5][8], p4: &face[5][6]);
                changeLoop(&face[5][1], p2: &face[5][5], p3: &face[5][7], p4: &face[5][3]);
            }
            else if op == "L" {
                // L
                changeLoop(&face[2][0], p2: &face[1][0], p3: &face[3][8], p4: &face[0][0]);
                changeLoop(&face[2][3], p2: &face[1][3], p3: &face[3][5], p4: &face[0][3]);
                changeLoop(&face[2][6], p2: &face[1][6], p3: &face[3][2], p4: &face[0][6]);
                changeLoop(&face[4][0], p2: &face[4][2], p3: &face[4][8], p4: &face[4][6]);
                changeLoop(&face[4][1], p2: &face[4][5], p3: &face[4][7], p4: &face[4][3]);
            }
            else if op == "F" {
                // F
                changeLoop(&face[4][2], p2: &face[0][8], p3: &face[5][6], p4: &face[1][0]);
                changeLoop(&face[4][5], p2: &face[0][7], p3: &face[5][3], p4: &face[1][1]);
                changeLoop(&face[4][8], p2: &face[0][6], p3: &face[5][0], p4: &face[1][2]);
                changeLoop(&face[2][0], p2: &face[2][2], p3: &face[2][8], p4: &face[2][6]);
                changeLoop(&face[2][1], p2: &face[2][5], p3: &face[2][7], p4: &face[2][3]);
            }
            else if op == "B" {
                // B
                changeLoop(&face[0][0], p2: &face[4][6], p3: &face[1][8], p4: &face[5][2]);
                changeLoop(&face[0][1], p2: &face[4][3], p3: &face[1][7], p4: &face[5][5]);
                changeLoop(&face[0][2], p2: &face[4][0], p3: &face[1][6], p4: &face[5][8]);
                changeLoop(&face[3][0], p2: &face[3][2], p3: &face[3][8], p4: &face[3][6]);
                changeLoop(&face[3][1], p2: &face[3][5], p3: &face[3][7], p4: &face[3][3]);
            }
            else if op == "u" {
                // u
                changeLoop(&face[2][0], p2: &face[4][0], p3: &face[3][0], p4: &face[5][0]);
                changeLoop(&face[2][1], p2: &face[4][1], p3: &face[3][1], p4: &face[5][1]);
                changeLoop(&face[2][2], p2: &face[4][2], p3: &face[3][2], p4: &face[5][2]);
                changeLoop(&face[0][0], p2: &face[0][2], p3: &face[0][8], p4: &face[0][6]);
                changeLoop(&face[0][1], p2: &face[0][5], p3: &face[0][7], p4: &face[0][3]);
                
                changeLoop(&face[2][3], p2: &face[4][3], p3: &face[3][3], p4: &face[5][3]);
                changeLoop(&face[2][4], p2: &face[4][4], p3: &face[3][4], p4: &face[5][4]);
                changeLoop(&face[2][5], p2: &face[4][5], p3: &face[3][5], p4: &face[5][5]);
            }
            else if op == "d" {
                // d
                changeLoop(&face[2][6], p2: &face[5][6], p3: &face[3][6], p4: &face[4][6]);
                changeLoop(&face[2][7], p2: &face[5][7], p3: &face[3][7], p4: &face[4][7]);
                changeLoop(&face[2][8], p2: &face[5][8], p3: &face[3][8], p4: &face[4][8]);
                changeLoop(&face[1][0], p2: &face[1][2], p3: &face[1][8], p4: &face[1][6]);
                changeLoop(&face[1][1], p2: &face[1][5], p3: &face[1][7], p4: &face[1][3]);
                
                changeLoop(&face[2][3], p2: &face[5][3], p3: &face[3][3], p4: &face[4][3]);
                changeLoop(&face[2][4], p2: &face[5][4], p3: &face[3][4], p4: &face[4][4]);
                changeLoop(&face[2][5], p2: &face[5][5], p3: &face[3][5], p4: &face[4][5]);
            }
            else if op == "r" {
                // r
                changeLoop(&face[2][2], p2: &face[0][2], p3: &face[3][6], p4: &face[1][2]);
                changeLoop(&face[2][5], p2: &face[0][5], p3: &face[3][3], p4: &face[1][5]);
                changeLoop(&face[2][8], p2: &face[0][8], p3: &face[3][0], p4: &face[1][8]);
                changeLoop(&face[5][0], p2: &face[5][2], p3: &face[5][8], p4: &face[5][6]);
                changeLoop(&face[5][1], p2: &face[5][5], p3: &face[5][7], p4: &face[5][3]);
                
                changeLoop(&face[2][1], p2: &face[0][1], p3: &face[3][7], p4: &face[1][1]);
                changeLoop(&face[2][4], p2: &face[0][4], p3: &face[3][4], p4: &face[1][4]);
                changeLoop(&face[2][7], p2: &face[0][7], p3: &face[3][1], p4: &face[1][7]);
            }
            else if op == "l" {
                // l
                changeLoop(&face[2][0], p2: &face[1][0], p3: &face[3][8], p4: &face[0][0]);
                changeLoop(&face[2][3], p2: &face[1][3], p3: &face[3][5], p4: &face[0][3]);
                changeLoop(&face[2][6], p2: &face[1][6], p3: &face[3][2], p4: &face[0][6]);
                changeLoop(&face[4][0], p2: &face[4][2], p3: &face[4][8], p4: &face[4][6]);
                changeLoop(&face[4][1], p2: &face[4][5], p3: &face[4][7], p4: &face[4][3]);
                
                changeLoop(&face[2][1], p2: &face[1][1], p3: &face[3][7], p4: &face[0][1]);
                changeLoop(&face[2][4], p2: &face[1][4], p3: &face[3][4], p4: &face[0][4]);
                changeLoop(&face[2][7], p2: &face[1][7], p3: &face[3][1], p4: &face[0][7]);
            }
            else if op == "f" {
                // f
                changeLoop(&face[4][2], p2: &face[0][8], p3: &face[5][6], p4: &face[1][0]);
                changeLoop(&face[4][5], p2: &face[0][7], p3: &face[5][3], p4: &face[1][1]);
                changeLoop(&face[4][8], p2: &face[0][6], p3: &face[5][0], p4: &face[1][2]);
                changeLoop(&face[2][0], p2: &face[2][2], p3: &face[2][8], p4: &face[2][6]);
                changeLoop(&face[2][1], p2: &face[2][5], p3: &face[2][7], p4: &face[2][3]);
                
                changeLoop(&face[0][3], p2: &face[5][1], p3: &face[1][5], p4: &face[4][7]);
                changeLoop(&face[0][4], p2: &face[5][4], p3: &face[1][4], p4: &face[4][4]);
                changeLoop(&face[0][5], p2: &face[5][7], p3: &face[1][3], p4: &face[4][1]);
            }
            else if op == "b" {
                // b
                changeLoop(&face[0][0], p2: &face[4][6], p3: &face[1][8], p4: &face[5][2]);
                changeLoop(&face[0][1], p2: &face[4][3], p3: &face[1][7], p4: &face[5][5]);
                changeLoop(&face[0][2], p2: &face[4][0], p3: &face[1][6], p4: &face[5][8]);
                changeLoop(&face[3][0], p2: &face[3][2], p3: &face[3][8], p4: &face[3][6]);
                changeLoop(&face[3][1], p2: &face[3][5], p3: &face[3][7], p4: &face[3][3]);
                
                changeLoop(&face[0][3], p2: &face[4][7], p3: &face[1][5], p4: &face[5][1]);
                changeLoop(&face[0][4], p2: &face[4][4], p3: &face[1][4], p4: &face[5][4]);
                changeLoop(&face[0][5], p2: &face[4][1], p3: &face[1][3], p4: &face[5][7]);
            }
            else if op == "x" {
                // x = r + L'
                changeLoop(&face[2][2], p2: &face[0][2], p3: &face[3][6], p4: &face[1][2]);
                changeLoop(&face[2][5], p2: &face[0][5], p3: &face[3][3], p4: &face[1][5]);
                changeLoop(&face[2][8], p2: &face[0][8], p3: &face[3][0], p4: &face[1][8]);
                changeLoop(&face[5][0], p2: &face[5][2], p3: &face[5][8], p4: &face[5][6]);
                changeLoop(&face[5][1], p2: &face[5][5], p3: &face[5][7], p4: &face[5][3]);
                
                changeLoop(&face[2][1], p2: &face[0][1], p3: &face[3][7], p4: &face[1][1]);
                changeLoop(&face[2][4], p2: &face[0][4], p3: &face[3][4], p4: &face[1][4]);
                changeLoop(&face[2][7], p2: &face[0][7], p3: &face[3][1], p4: &face[1][7]);
                
                changeLoop(&face[2][0], p2: &face[0][0], p3: &face[3][8], p4: &face[1][0]);
                changeLoop(&face[2][3], p2: &face[0][3], p3: &face[3][5], p4: &face[1][3]);
                changeLoop(&face[2][6], p2: &face[0][6], p3: &face[3][2], p4: &face[1][6]);
                changeLoop(&face[4][0], p2: &face[4][6], p3: &face[4][8], p4: &face[4][2]);
                changeLoop(&face[4][1], p2: &face[4][3], p3: &face[4][7], p4: &face[4][5]);
            }
            else if op == "y" {
                // y = u + D'
                changeLoop(&face[2][0], p2: &face[4][0], p3: &face[3][0], p4: &face[5][0]);
                changeLoop(&face[2][1], p2: &face[4][1], p3: &face[3][1], p4: &face[5][1]);
                changeLoop(&face[2][2], p2: &face[4][2], p3: &face[3][2], p4: &face[5][2]);
                changeLoop(&face[0][0], p2: &face[0][2], p3: &face[0][8], p4: &face[0][6]);
                changeLoop(&face[0][1], p2: &face[0][5], p3: &face[0][7], p4: &face[0][3]);
                
                changeLoop(&face[2][3], p2: &face[4][3], p3: &face[3][3], p4: &face[5][3]);
                changeLoop(&face[2][4], p2: &face[4][4], p3: &face[3][4], p4: &face[5][4]);
                changeLoop(&face[2][5], p2: &face[4][5], p3: &face[3][5], p4: &face[5][5]);
                
                changeLoop(&face[2][6], p2: &face[4][6], p3: &face[3][6], p4: &face[5][6]);
                changeLoop(&face[2][7], p2: &face[4][7], p3: &face[3][7], p4: &face[5][7]);
                changeLoop(&face[2][8], p2: &face[4][8], p3: &face[3][8], p4: &face[5][8]);
                changeLoop(&face[1][0], p2: &face[1][6], p3: &face[1][8], p4: &face[1][2]);
                changeLoop(&face[1][1], p2: &face[1][3], p3: &face[1][7], p4: &face[1][5]);
            }
            else if op == "z" {
                // z = f + B'
                changeLoop(&face[4][2], p2: &face[0][8], p3: &face[5][6], p4: &face[1][0]);
                changeLoop(&face[4][5], p2: &face[0][7], p3: &face[5][3], p4: &face[1][1]);
                changeLoop(&face[4][8], p2: &face[0][6], p3: &face[5][0], p4: &face[1][2]);
                changeLoop(&face[2][0], p2: &face[2][2], p3: &face[2][8], p4: &face[2][6]);
                changeLoop(&face[2][1], p2: &face[2][5], p3: &face[2][7], p4: &face[2][3]);
                
                changeLoop(&face[0][3], p2: &face[5][1], p3: &face[1][5], p4: &face[4][7]);
                changeLoop(&face[0][4], p2: &face[5][4], p3: &face[1][4], p4: &face[4][4]);
                changeLoop(&face[0][5], p2: &face[5][7], p3: &face[1][3], p4: &face[4][1]);
                
                changeLoop(&face[0][0], p2: &face[5][2], p3: &face[1][8], p4: &face[4][6]);
                changeLoop(&face[0][1], p2: &face[5][5], p3: &face[1][7], p4: &face[4][3]);
                changeLoop(&face[0][2], p2: &face[5][8], p3: &face[1][6], p4: &face[4][0]);
                changeLoop(&face[3][0], p2: &face[3][6], p3: &face[3][8], p4: &face[3][2]);
                changeLoop(&face[3][1], p2: &face[3][3], p3: &face[3][7], p4: &face[3][5]);
            }
        }
        else {
            if op == "U" {
                // U'
                changeLoop(&face[2][0], p2: &face[5][0], p3: &face[3][0], p4: &face[4][0]);
                changeLoop(&face[2][1], p2: &face[5][1], p3: &face[3][1], p4: &face[4][1]);
                changeLoop(&face[2][2], p2: &face[5][2], p3: &face[3][2], p4: &face[4][2]);
                changeLoop(&face[0][0], p2: &face[0][6], p3: &face[0][8], p4: &face[0][2]);
                changeLoop(&face[0][1], p2: &face[0][3], p3: &face[0][7], p4: &face[0][5]);
            }
            else if op == "D" {
                // D'
                changeLoop(&face[2][6], p2: &face[4][6], p3: &face[3][6], p4: &face[5][6]);
                changeLoop(&face[2][7], p2: &face[4][7], p3: &face[3][7], p4: &face[5][7]);
                changeLoop(&face[2][8], p2: &face[4][8], p3: &face[3][8], p4: &face[5][8]);
                changeLoop(&face[1][0], p2: &face[1][6], p3: &face[1][8], p4: &face[1][2]);
                changeLoop(&face[1][1], p2: &face[1][3], p3: &face[1][7], p4: &face[1][5]);
            }
            else if op == "R" {
                // R'
                changeLoop(&face[2][2], p2: &face[1][2], p3: &face[3][6], p4: &face[0][2]);
                changeLoop(&face[2][5], p2: &face[1][5], p3: &face[3][3], p4: &face[0][5]);
                changeLoop(&face[2][8], p2: &face[1][8], p3: &face[3][0], p4: &face[0][8]);
                changeLoop(&face[5][0], p2: &face[5][6], p3: &face[5][8], p4: &face[5][2]);
                changeLoop(&face[5][1], p2: &face[5][3], p3: &face[5][7], p4: &face[5][5]);
            }
            else if op == "L" {
                // L'
                changeLoop(&face[2][0], p2: &face[0][0], p3: &face[3][8], p4: &face[1][0]);
                changeLoop(&face[2][3], p2: &face[0][3], p3: &face[3][5], p4: &face[1][3]);
                changeLoop(&face[2][6], p2: &face[0][6], p3: &face[3][2], p4: &face[1][6]);
                changeLoop(&face[4][0], p2: &face[4][6], p3: &face[4][8], p4: &face[4][2]);
                changeLoop(&face[4][1], p2: &face[4][3], p3: &face[4][7], p4: &face[4][5]);
            }
            else if op == "F" {
                // F'
                changeLoop(&face[4][2], p2: &face[1][0], p3: &face[5][6], p4: &face[0][8]);
                changeLoop(&face[4][5], p2: &face[1][1], p3: &face[5][3], p4: &face[0][7]);
                changeLoop(&face[4][8], p2: &face[1][2], p3: &face[5][0], p4: &face[0][6]);
                changeLoop(&face[2][0], p2: &face[2][6], p3: &face[2][8], p4: &face[2][2]);
                changeLoop(&face[2][1], p2: &face[2][3], p3: &face[2][7], p4: &face[2][5]);
            }
            else if op == "B" {
                // B'
                changeLoop(&face[0][0], p2: &face[5][2], p3: &face[1][8], p4: &face[4][6]);
                changeLoop(&face[0][1], p2: &face[5][5], p3: &face[1][7], p4: &face[4][3]);
                changeLoop(&face[0][2], p2: &face[5][8], p3: &face[1][6], p4: &face[4][0]);
                changeLoop(&face[3][0], p2: &face[3][6], p3: &face[3][8], p4: &face[3][2]);
                changeLoop(&face[3][1], p2: &face[3][3], p3: &face[3][7], p4: &face[3][5]);
            }
            else if op == "u" {
                // u'
                changeLoop(&face[2][0], p2: &face[5][0], p3: &face[3][0], p4: &face[4][0]);
                changeLoop(&face[2][1], p2: &face[5][1], p3: &face[3][1], p4: &face[4][1]);
                changeLoop(&face[2][2], p2: &face[5][2], p3: &face[3][2], p4: &face[4][2]);
                changeLoop(&face[0][0], p2: &face[0][6], p3: &face[0][8], p4: &face[0][2]);
                changeLoop(&face[0][1], p2: &face[0][3], p3: &face[0][7], p4: &face[0][5]);
                
                changeLoop(&face[2][3], p2: &face[5][3], p3: &face[3][3], p4: &face[4][3]);
                changeLoop(&face[2][4], p2: &face[5][4], p3: &face[3][4], p4: &face[4][4]);
                changeLoop(&face[2][5], p2: &face[5][5], p3: &face[3][5], p4: &face[4][5]);
            }
            else if op == "d" {
                // d'
                changeLoop(&face[2][6], p2: &face[4][6], p3: &face[3][6], p4: &face[5][6]);
                changeLoop(&face[2][7], p2: &face[4][7], p3: &face[3][7], p4: &face[5][7]);
                changeLoop(&face[2][8], p2: &face[4][8], p3: &face[3][8], p4: &face[5][8]);
                changeLoop(&face[1][0], p2: &face[1][6], p3: &face[1][8], p4: &face[1][2]);
                changeLoop(&face[1][1], p2: &face[1][3], p3: &face[1][7], p4: &face[1][5]);
                
                changeLoop(&face[2][3], p2: &face[4][3], p3: &face[3][3], p4: &face[5][3]);
                changeLoop(&face[2][4], p2: &face[4][4], p3: &face[3][4], p4: &face[5][4]);
                changeLoop(&face[2][5], p2: &face[4][5], p3: &face[3][5], p4: &face[5][5]);
            }
            else if op == "r" {
                // r'
                changeLoop(&face[2][2], p2: &face[1][2], p3: &face[3][6], p4: &face[0][2]);
                changeLoop(&face[2][5], p2: &face[1][5], p3: &face[3][3], p4: &face[0][5]);
                changeLoop(&face[2][8], p2: &face[1][8], p3: &face[3][0], p4: &face[0][8]);
                changeLoop(&face[5][0], p2: &face[5][6], p3: &face[5][8], p4: &face[5][2]);
                changeLoop(&face[5][1], p2: &face[5][3], p3: &face[5][7], p4: &face[5][5]);
                
                changeLoop(&face[2][1], p2: &face[1][1], p3: &face[3][7], p4: &face[0][1]);
                changeLoop(&face[2][4], p2: &face[1][4], p3: &face[3][4], p4: &face[0][4]);
                changeLoop(&face[2][7], p2: &face[1][7], p3: &face[3][1], p4: &face[0][7]);
            }
            else if op == "l" {
                // l'
                changeLoop(&face[2][0], p2: &face[0][0], p3: &face[3][8], p4: &face[1][0]);
                changeLoop(&face[2][3], p2: &face[0][3], p3: &face[3][5], p4: &face[1][3]);
                changeLoop(&face[2][6], p2: &face[0][6], p3: &face[3][2], p4: &face[1][6]);
                changeLoop(&face[4][0], p2: &face[4][6], p3: &face[4][8], p4: &face[4][2]);
                changeLoop(&face[4][1], p2: &face[4][3], p3: &face[4][7], p4: &face[4][5]);
                
                changeLoop(&face[2][1], p2: &face[0][1], p3: &face[3][7], p4: &face[1][1]);
                changeLoop(&face[2][4], p2: &face[0][4], p3: &face[3][4], p4: &face[1][4]);
                changeLoop(&face[2][7], p2: &face[0][7], p3: &face[3][1], p4: &face[1][7]);
            }
            else if op == "f" {
                // f'
                changeLoop(&face[4][2], p2: &face[1][0], p3: &face[5][6], p4: &face[0][8]);
                changeLoop(&face[4][5], p2: &face[1][1], p3: &face[5][3], p4: &face[0][7]);
                changeLoop(&face[4][8], p2: &face[1][2], p3: &face[5][0], p4: &face[0][6]);
                changeLoop(&face[2][0], p2: &face[2][6], p3: &face[2][8], p4: &face[2][2]);
                changeLoop(&face[2][1], p2: &face[2][3], p3: &face[2][7], p4: &face[2][5]);
                
                changeLoop(&face[0][3], p2: &face[4][7], p3: &face[1][5], p4: &face[5][1]);
                changeLoop(&face[0][4], p2: &face[4][4], p3: &face[1][4], p4: &face[5][4]);
                changeLoop(&face[0][5], p2: &face[4][1], p3: &face[1][3], p4: &face[5][7]);
            }
            else if op == "b" {
                // b'
                changeLoop(&face[0][0], p2: &face[5][2], p3: &face[1][8], p4: &face[4][6]);
                changeLoop(&face[0][1], p2: &face[5][5], p3: &face[1][7], p4: &face[4][3]);
                changeLoop(&face[0][2], p2: &face[5][8], p3: &face[1][6], p4: &face[4][0]);
                changeLoop(&face[3][0], p2: &face[3][6], p3: &face[3][8], p4: &face[3][2]);
                changeLoop(&face[3][1], p2: &face[3][3], p3: &face[3][7], p4: &face[3][5]);
                
                changeLoop(&face[0][3], p2: &face[5][1], p3: &face[1][5], p4: &face[4][7]);
                changeLoop(&face[0][4], p2: &face[5][4], p3: &face[1][4], p4: &face[4][4]);
                changeLoop(&face[0][5], p2: &face[5][7], p3: &face[1][3], p4: &face[4][1]);
            }
            else if op == "x" {
                // x' = l + R'
                changeLoop(&face[2][0], p2: &face[1][0], p3: &face[3][8], p4: &face[0][0]);
                changeLoop(&face[2][3], p2: &face[1][3], p3: &face[3][5], p4: &face[0][3]);
                changeLoop(&face[2][6], p2: &face[1][6], p3: &face[3][2], p4: &face[0][6]);
                changeLoop(&face[4][0], p2: &face[4][2], p3: &face[4][8], p4: &face[4][6]);
                changeLoop(&face[4][1], p2: &face[4][5], p3: &face[4][7], p4: &face[4][3]);
                
                changeLoop(&face[2][1], p2: &face[1][1], p3: &face[3][7], p4: &face[0][1]);
                changeLoop(&face[2][4], p2: &face[1][4], p3: &face[3][4], p4: &face[0][4]);
                changeLoop(&face[2][7], p2: &face[1][7], p3: &face[3][1], p4: &face[0][7]);
                
                changeLoop(&face[2][2], p2: &face[1][2], p3: &face[3][6], p4: &face[0][2]);
                changeLoop(&face[2][5], p2: &face[1][5], p3: &face[3][3], p4: &face[0][5]);
                changeLoop(&face[2][8], p2: &face[1][8], p3: &face[3][0], p4: &face[0][8]);
                changeLoop(&face[5][0], p2: &face[5][6], p3: &face[5][8], p4: &face[5][2]);
                changeLoop(&face[5][1], p2: &face[5][3], p3: &face[5][7], p4: &face[5][5]);
            }
            else if op == "y" {
                // y' = d + U'
                changeLoop(&face[2][6], p2: &face[5][6], p3: &face[3][6], p4: &face[4][6]);
                changeLoop(&face[2][7], p2: &face[5][7], p3: &face[3][7], p4: &face[4][7]);
                changeLoop(&face[2][8], p2: &face[5][8], p3: &face[3][8], p4: &face[4][8]);
                changeLoop(&face[1][0], p2: &face[1][2], p3: &face[1][8], p4: &face[1][6]);
                changeLoop(&face[1][1], p2: &face[1][5], p3: &face[1][7], p4: &face[1][3]);
                
                changeLoop(&face[2][3], p2: &face[5][3], p3: &face[3][3], p4: &face[4][3]);
                changeLoop(&face[2][4], p2: &face[5][4], p3: &face[3][4], p4: &face[4][4]);
                changeLoop(&face[2][5], p2: &face[5][5], p3: &face[3][5], p4: &face[4][5]);
                
                changeLoop(&face[2][0], p2: &face[5][0], p3: &face[3][0], p4: &face[4][0]);
                changeLoop(&face[2][1], p2: &face[5][1], p3: &face[3][1], p4: &face[4][1]);
                changeLoop(&face[2][2], p2: &face[5][2], p3: &face[3][2], p4: &face[4][2]);
                changeLoop(&face[0][0], p2: &face[0][6], p3: &face[0][8], p4: &face[0][2]);
                changeLoop(&face[0][1], p2: &face[0][3], p3: &face[0][7], p4: &face[0][5]);
            }
            else if op == "z" {
                // z' = b + F'
                changeLoop(&face[0][0], p2: &face[4][6], p3: &face[1][8], p4: &face[5][2]);
                changeLoop(&face[0][1], p2: &face[4][3], p3: &face[1][7], p4: &face[5][5]);
                changeLoop(&face[0][2], p2: &face[4][0], p3: &face[1][6], p4: &face[5][8]);
                changeLoop(&face[3][0], p2: &face[3][2], p3: &face[3][8], p4: &face[3][6]);
                changeLoop(&face[3][1], p2: &face[3][5], p3: &face[3][7], p4: &face[3][3]);
                
                changeLoop(&face[0][3], p2: &face[4][7], p3: &face[1][5], p4: &face[5][1]);
                changeLoop(&face[0][4], p2: &face[4][4], p3: &face[1][4], p4: &face[5][4]);
                changeLoop(&face[0][5], p2: &face[4][1], p3: &face[1][3], p4: &face[5][7]);
                
                changeLoop(&face[4][2], p2: &face[1][0], p3: &face[5][6], p4: &face[0][8]);
                changeLoop(&face[4][5], p2: &face[1][1], p3: &face[5][3], p4: &face[0][7]);
                changeLoop(&face[4][8], p2: &face[1][2], p3: &face[5][0], p4: &face[0][6]);
                changeLoop(&face[2][0], p2: &face[2][6], p3: &face[2][8], p4: &face[2][2]);
                changeLoop(&face[2][1], p2: &face[2][3], p3: &face[2][7], p4: &face[2][5]);
            }
        }
    }
    
}