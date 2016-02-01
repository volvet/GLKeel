//
//  GLKeenContext.h
//  GLK-2
//
//  Created by Volvet Zhang on 16/2/1.
//  Copyright © 2016年 volvet. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface GLKeenContext : EAGLContext {
    GLKVector4   clearColor;
}

@property (nonatomic, assign, readwrite) GLKVector4 clearColor;

- (void) clear: (GLbitfield)mask;
- (void) enable: (GLenum)capability;
- (void) disable: (GLenum)capability;
- (void) setBlendSourceFunction: (GLenum)sfactor destinationFunction:(GLenum)dfactor;

@end
