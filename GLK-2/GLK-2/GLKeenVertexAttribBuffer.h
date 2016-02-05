//
//  GLKeenVertexAttribBuffer.h
//  GLK-2
//
//  Created by Volvet Zhang on 16/2/4.
//  Copyright © 2016年 volvet. All rights reserved.
//

#ifndef GLKeenVertexAttribBuffer_h
#define GLKeenVertexAttribBuffer_h

#import <GLKit/GLKit.h>

@interface GLKeenVertexAttribBuffer : NSObject
{
    GLsizei       mStride;
    GLsizeiptr    mBufferSize;
    GLuint        mName;
}

@property (nonatomic, readonly, assign)  GLsizei     mStride;
@property (nonatomic, readonly, assign)  GLsizeiptr  mBufferSize;
@property (nonatomic, readonly, assign)  GLuint      mName;

+ (void) drawPreparedArraysWithMode :(GLenum)mode startVertexIndex:(GLsizei)first numberOfVertices:(GLsizei)count;

- (id) initWithAttribStride: (GLsizei)stride
           numberOfVertices: (GLsizei)count
                      bytes: (GLvoid*)dataPtr
                      usage: (GLenum)usage;


- (void) prepareToDrawWithAttrib: (GLuint)index
              numberOfCoordinats: (GLint)count
                    attribOffset: (GLsizeiptr)offset
                    shouldEnable: (BOOL)shouldEnable;

- (void) prepareToDrawWidhMode: (GLenum)mode
              startVertexIndex: (GLint)first
              numberOfVertices: (GLsizei)count;

- (void) reinitWithAttribStride: (GLsizei)stride
               numberOfVertices: (GLsizei)count
                          bytes: (GLvoid*)dataPtr;

@end


#endif /* GLKeenVertexAttribBuffer_h */
