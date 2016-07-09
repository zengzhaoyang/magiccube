//
//  Shader.metal
//  gltest
//
//  Created by ZengZhaoyang on 16/6/29.
//  Copyright © 2016年 ZengZhaoyang. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    packed_float3 position;
    packed_float4 color;
    packed_float2 texCoord;
};

struct VertexOut {
    float4 position [[position]];
    float4 color;
    float2 texCoord;
};

struct Uniforms {
    float4x4 modelMatrix;
    float4x4 projectionMatrix;
};

//vertex VertexOut basic_vertex(
//    const device VertexIn* vertex_array [[ buffer(0)]],
//                           unsigned int vid [[vertex_id]]) {
//    VertexIn VertexIn = vertex_array[vid];
//    
//    VertexOut VertexOut;
//    VertexOut.position = float4(VertexIn.position, 1);
//    VertexOut.color = VertexIn.color;
//    return VertexOut;
//}
//
//fragment half4 basic_fragment(VertexOut interpolated [[stage_in]]) {
//    return half4(interpolated.color[0], interpolated.color[1], interpolated.color[2], interpolated.color[3]);
//}


vertex VertexOut basic_vertex(
    const device VertexIn* vertex_array [[ buffer(0)]],
    const device Uniforms& uniforms [[buffer(1)]],
    unsigned int vid [[vertex_id]]) {
    
    float4x4 mv_matrix = uniforms.modelMatrix;
    float4x4 proj_matrix = uniforms.projectionMatrix;
    VertexIn VertexIn = vertex_array[vid];
    VertexOut VertexOut;
    VertexOut.position = proj_matrix * mv_matrix * float4(VertexIn.position, 1);
    VertexOut.color = VertexIn.color;
    VertexOut.texCoord = VertexIn.texCoord;
    return VertexOut;
}

fragment float4 basic_fragment(VertexOut interpolated [[stage_in]],
                              texture2d<float> tex2D [[texture(0)]],
                              sampler sampler2D [[sampler(0)]]) {
    float4 color = tex2D.sample(sampler2D, interpolated.texCoord);
    return color;
}
