//
//  ImageManager.m
//  gltest
//
//  Created by ZengZhaoyang on 16/7/7.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageManager.h"

@implementation ImageManager 
+ (void)test: (CVImageBufferRef) imageBuffer {
    
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    unsigned char* base = CVPixelBufferGetBaseAddress(imageBuffer);
    int bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    int width = CVPixelBufferGetWidth(imageBuffer);
    int height = CVPixelBufferGetHeight(imageBuffer);
    
    int offset = 4;
    
    float pointx[7] = {0.5, 0.08, 0.08, 0.5, 0.92, 0.92, 0.5};
    float pointy[7] = {0.18, 0.31, 0.58, 0.73, 0.58, 0.31, 0.18, 0.45};
    
    int p1y = 0.5 * height;
    int p1x = 0.63 * width;
    int p2y = 0.29 * height;
    int p2x = 0.38 * width;
    int p3y = 0.71 * height;
    int p3x = 0.38 * width;
    
    printf("%d %d %d ; %d %d %d; %d %d %d;\n",
          base[p1x*height+p1y*4], base[p1x*height+p1y*4+1],base[p1x*height+p1y*4+2],
          base[p2x*height+p2y*4], base[p2x*height+p2y*4+1],base[p2x*height+p2y*4+2],
          base[p3x*height+p3y*4], base[p3x*height+p3y*4+1],base[p3x*height+p3y*4+2]
          );
    
}
@end