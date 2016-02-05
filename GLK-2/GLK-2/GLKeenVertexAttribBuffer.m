//
//  GLKeenVertexAttribBuffer.m
//  GLK-2
//
//  Created by Volvet Zhang on 16/2/4.
//  Copyright © 2016年 volvet. All rights reserved.
//

#import "GLKeenVertexAttribBuffer.h"


@interface GLKeenVertexAttribBuffer()


@end

@implementation GLKeenVertexAttribBuffer

@synthesize mStride;
@synthesize mBufferSize;
@synthesize mName;

+ (void) drawPreparedArraysWithMode: (GLenum)mode startVertexIndex:(GLsizei)first numberOfVertices:(GLsizei)count {
    glDrawArrays(mode, first, count);
}

- (id) initWithAttribStride:(GLsizei)stride numberOfVertices:(GLsizei)count bytes:(GLvoid*)dataPtr usage:(GLenum)usage {
    NSParameterAssert(stride > 0);
    NSParameterAssert(dataPtr != nil);
    NSParameterAssert(count > 0);
    
    if( (self = [super init]) != nil ){
        mStride = stride;
        mBufferSize = stride * count;
        
        glGenBuffers(1, &mName);
        glBindBuffer(GL_ARRAY_BUFFER, mName);
        glBufferData(GL_ARRAY_BUFFER, mBufferSize, dataPtr, usage);
        
        NSAssert(mName != 0, @"Failed to generate GL buffers");
    }
    
    return self;
}

- (void) reinitWithAttribStride:(GLsizei)stride numberOfVertices:(GLsizei)count bytes:(GLvoid*)dataPtr {
    NSParameterAssert(stride > 0);
    NSParameterAssert(dataPtr != nil);
    NSParameterAssert(count > 0);
    NSAssert(0 != mName, @"Invalid name");
    
    mStride = stride;
    mBufferSize = stride * count;
    
    glBindBuffer(GL_ARRAY_BUFFER, mName);
    glBufferData(GL_ARRAY_BUFFER, mBufferSize, dataPtr, GL_DYNAMIC_DRAW);
    
}

- (void) prepareToDrawWithAttrib:(GLuint)index numberOfCoordinats:(GLint)count attribOffset:(GLsizeiptr)offset shouldEnable:(BOOL)shouldEnable {
    glBindBuffer(GL_ARRAY_BUFFER, mName);
    if( shouldEnable ){
        glEnableVertexAttribArray(index);
    }
    glVertexAttribPointer(index, count, GL_FLOAT, GL_FALSE, mStride, NULL + offset);
}

- (void) prepareToDrawWidhMode:(GLenum)mode startVertexIndex:(GLint)first numberOfVertices:(GLsizei)count {
    NSAssert(self.mBufferSize > (first + count)*mStride, @"attemp to draw more vertices than available");
    glDrawArrays(mode, first, count);
}

- (void) dealloc {
    if( 0 != mName ){
        glDeleteBuffers(1, &mName);
        mName = 0;
    }
}

@end